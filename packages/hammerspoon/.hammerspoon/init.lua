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
  local pictureDir = os.getenv("HOME") .. "/Pictures/0001_img_dtp-pic/0002_img_mac-wallpaper/"
  if (not appearanceMode) then
    pictureDir = pictureDir .. "0001_img_dtp-pic-morning/"
  else
    pictureDir = pictureDir .. "0002_img_dtp-pic-night/"
  end
  local pictures = {}
  for file in hs.fs.dir(pictureDir) do
    if (file ~= "." and file ~= "..") then table.insert(pictures, file) end
  end
  return "file://" .. pictureDir .. pictures[math.random(#pictures)]
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
  if (getApp("Music") ~= nil) then
    hs.itunes.playpause()
  elseif (getApp("Spotify") ~= nil) then
    hs.spotify.playpause()
  elseif (getApp("Podcasts") ~= nil) then
    hs.eventtap.keyStroke({}, "space", getApp("Podcasts"))
  elseif (getApp("Arc") ~= nil) then
    hs.eventtap.keyStroke("option", "space", getApp("Arc"))
  end
end)


-- FileSync

FileSyncTimer = hs.timer.new(30 * 60, function()
  local folder = os.getenv("HOME") .. "/Save Folder/0001_data_app-data/FreeFileSync/"
  local files = { "Sync iCloud.ffs_batch", "Sync Strage.ffs_batch" }
  for _, file in ipairs(files) do hs.open(folder .. file) end
  hs.osascript.applescript('tell app "Shortcuts" to run shortcut "Backup"')
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
  local appearanceMode = getAppearanceMode()
  if (eventType == hs.caffeinate.watcher.systemDidWake) then
    setDesktopPicture(appearanceMode)
  end
end):start()


-- Spotify Advertisements Skipper

SpotifyWatcher = hs.application.watcher.new(function(appName, eventType)
  if (appName == "Spotify") then
    if (eventType == hs.application.watcher.launched) then
      SpotifyTimer = hs.timer.new(1, function()
        if (hs.spotify.getCurrentArtist() == "") then
          getApp("Spotify"):kill()
          hs.timer.waitWhile(function() return hs.spotify.isRunning() end, function()
            hs.osascript.applescript('tell app "Spotify" to set shuffling to false')
            hs.spotify.play()
            hs.osascript.applescript('tell app "Spotify" to set shuffling to true')
          end)
        end
      end):start()
    elseif (eventType == hs.application.watcher.terminated) then
      SpotifyTimer:stop()
    end
  end
end):start()
