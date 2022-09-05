const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        proxima: ['"Proxima Nova"', ...defaultTheme.fontFamily.sans],
      },
      "main": {
        "50": "#ebf2f9",
        "100": "#d7e4f3",
        "200": "#afc9e7",
        "300": "#87aeda",
        "400": "#5f93ce",
        "500": "#3778c2",
        "600": "#2c609b",
        "700": "#214874",
        "800": "#16304e",
        "900": "#0b1827"
      },
      "secondary": {
        "50": "#eff8e9",
        "100": "#dff0d3",
        "200": "#bfe1a7",
        "300": "#9fd37b",
        "400": "#7fc44f",
        "500": "#5fb523",
        "600": "#4c911c",
        "700": "#396d15",
        "800": "#26480e",
        "900": "#132407"
      },
      "font": {
        "50": "#ecedee",
        "100": "#d9dbdd",
        "200": "#b4b7bb",
        "300": "#8e9398",
        "400": "#696f76",
        "500": "#434b54",
        "600": "#363c43",
        "700": "#282d32",
        "800": "#1b1e22",
        "900": "#0d0f11"
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
  ]
}
