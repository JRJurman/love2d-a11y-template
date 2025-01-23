# love-a11y-template

Accessible HTML template for [LÖVE / Love2d](https://love2d.org/) games, with a live read out for screen readers.

## Requirements

This depends on you being able to export your game with [love.js](https://github.com/2dengine/love.js).

## How To Use

First, copy the `a11y_template.html` in your project, and update title at the top of the page.

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

## Motivation

This gives developers an easy interface to work with, and allows end-users to use any browser-compatible screen reader. The interface and presentation is non-invasive for users who don't need screen-reader support, while offering that option for users who would benefit from it.

## Suggestions / PRs

PRs are definitely welcome, although this template should be considered more of a starting point for developers. It is not the intent that the template should be visually perfect for every game, rather, the expectation is that any developer can polish the web-page for whatever game or project they are building.

If there are accessibility issues with the template, or ways we could make the experience here more straight-forward, feel free to create issues on this repo, or provide PRs!
