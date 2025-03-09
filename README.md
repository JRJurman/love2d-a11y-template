# love2d-a11y-template

Accessible HTML template for [LÖVE / Love2d](https://love2d.org/) games, with a live read out for screen readers.

<img width="1029" alt="image" alt="Screenshot, there are 5 white dots on a black background, there is a VoiceOver preview with the following text: 'There are 5 white dots on a black background. Press up to increase the number or down to decrease the number'" src="./sample.png" />

## Requirements

This depends on you being able to export your game with [love.js](https://github.com/2dengine/love.js).

## How To Use

First, copy the `a11y_template.html` into your project.

Next, and throughout the development process, add `print` statements with the `tts:` prefix.

```lua
function love.load()
  print("tts:New Game Started!")
end
```

These will be consumed by the html template to be read out by screen readers. This text will also be visible for sighted users looking at the page.

After adding these lines to your game, export following the instructions in [love.js](https://github.com/2dengine/love.js), and copy the `a11y_template.html` to the generated folder as `index.html`

```sh
# create the game project
zip a11y.zip main.lua
mv a11y.zip a11y.love

# export using love.js
# (depending on your server config, compatibility mode, -c, may not be required)
love.js a11y.love a11y -t a11y -c

# copy the template over as index.html
cp a11y_template.html a11y/index.html
```

> [!important]
> It is recommended that you keep a copy of this template separate, so that you can copy this file after re-generating the template, otherwise it will be blown away.

Start the project locally with whatever server you'd like, or build an executable using tools like [Electron](https://www.electronjs.org/).

For immediate testing, you can run a local server with `npx serve` and navigate to `localhost:3000`:
```sh
npx serve a11y
```

## Sample Application

If you want to test what the project looks like, you can clone this repo, navigate to the `sample` directory in your terminal, and run the following:
```
npm ci
npm run build
npm start
```

This will do the above steps, and launch a very simple counter application.

## Motivation

This gives developers an easy interface to work with, and allows end-users to use any browser-compatible screen reader. The interface and presentation is non-invasive for users who don't need screen-reader support, while offering that option for users who would benefit from it.

## Suggestions / PRs

PRs are definitely welcome, although this template should be considered more of a starting point for developers. It is not the intent that the template should be visually perfect for every game, rather, the expectation is that any developer can polish the web-page for whatever game or project they are building.

If there are accessibility issues with the template, or ways we could make the experience here more straight-forward, feel free to create issues on this repo, or provide PRs!
