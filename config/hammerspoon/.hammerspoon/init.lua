-- Functions

local function getApp(appName)
  return hs.application.get(appName)
end

local function getAppearanceMode()
  local _, appearanceMode, _ = hs.osascript.applescript(
    'tell app "System Events" to tell appearance preferences to return dark mode')
  return appearanceMode
end

local function getRandomPicture(appearanceMode)
  local dir = os.getenv("HOME") .. "/Pictures/0001_img_dtp-pic/0001_img_mac-wallpaper/"
  if (not appearanceMode) then
    dir = dir .. "0001_img_dtp-pic-morning/"
  else
    dir = dir .. "0002_img_dtp-pic-night/"
  end
  local pictures = {}
  for _, file in pairs(hs.fs.fileListForPath(dir)) do
    table.insert(pictures, file)
  end
  return "file://" .. pictures[math.random(#pictures)]
end

local function setDesktopPicture(appearanceMode)
  for _, screen in ipairs(hs.screen.allScreens()) do
    screen:desktopImageURL(getRandomPicture(appearanceMode))
  end
end


-- Keybinds

hs.hotkey.bind({ "option", "shift" }, "q", function()
  hs.execute("pmset displaysleepnow")
end)
hs.hotkey.bind({ "cmd", "shift" }, "q", function()
  hs.osascript.applescript('tell app "loginwindow" to «event aevtrsdn»')
end)
hs.hotkey.bind({ "cmd", "ctrl" }, "q", function()
  hs.osascript.applescript('tell app "loginwindow" to «event aevtrrst»')
end)

hs.hotkey.bind("option", "space", function()
  local app
  local function setApp(appName)
    app = getApp(appName)
    return app
  end
  if (getApp("Music") ~= nil) then
    hs.itunes.playpause()
  elseif (getApp("Spotify") ~= nil) then
    hs.spotify.playpause()
  elseif (setApp("Podcasts") ~= nil) then
    hs.eventtap.keyStroke({}, "space", app)
  elseif (setApp("Arc") ~= nil) then
    hs.eventtap.keyStroke("option", "space", app)
  end
end)


-- FileSync

FileSyncTimer = hs.timer.new(60 * 60, function()
  local dir = os.getenv("HOME") .. "/Storage/0001_data_app-data/FreeFileSync"
  for _, file in pairs(hs.fs.fileListForPath(dir)) do hs.open(file) end
end):start()


-- Desktop Picture

PrevAppearance = nil
DesktopPictureTimer = hs.timer.new(1, function()
  local currentAppearance = getAppearanceMode()
  if (currentAppearance ~= PrevAppearance) then
    setDesktopPicture(currentAppearance)
    PrevAppearance = currentAppearance
  end
end):start()

DesktopPictureWatcher = hs.caffeinate.watcher.new(function(eventType)
  if (eventType == hs.caffeinate.watcher.systemDidWake) then
    setDesktopPicture(getAppearanceMode())
  end
end):start()


-- Restore Mackup
hs.execute [["mackup" "uninstall" "-f"]]
hs.execute [["mackup" "backup" "-f"]]


-- Spotify Advertisements Skipper

IsSpotifyQuit = false
SpotifyWatcher = hs.application.watcher.new(function(appName, eventType)
  if (appName == "Spotify") then
    if (eventType == hs.application.watcher.launched) then
      SpotifyTimer = hs.timer.new(1, function()
        if (hs.spotify.isPlaying() and hs.spotify.getCurrentArtist() == "") then
          IsSpotifyQuit = true
          getApp("Spotify"):kill()
        end
      end):start()
    elseif (eventType == hs.application.watcher.terminated) then
      SpotifyTimer:stop()
      if (IsSpotifyQuit) then
        IsSpotifyQuit = false
        hs.spotify.play()
        getApp("Spotify"):hide()
        hs.osascript.applescript('tell app "Spotify" to set shuffling to false')
        hs.osascript.applescript('tell app "Spotify" to set shuffling to true')
      else
        getApp("Spotify"):kill()
      end
    end
  end
end):start()
