module.exports.decorateBrowserOptions = opts => {
  opts.transparent = false;
  return opts;
}

module.exports.decorateConfig = config => {
  config.css += `
    .term_fit.term_active>.term_fit:not(.term_term) {
      opacity: 1;
      transition: opacity 0.3s ease-in-out;
      will-change: opacity;
    }
    .term_fit:not(.term_active)>.term_fit:not(.term_term) {
      opacity: 0.5;
    }
  `;
  return config;
}
