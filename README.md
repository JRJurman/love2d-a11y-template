# love2d-a11y-template

Accessible HTML template for [LÖVE / Love2d](https://love2d.org/) games, with a live read out for screen readers.

```lua
function love.load()
  print("tts:There are 5 white dots on a black background.")
end
```

<img width="1029" alt="image" alt="Screenshot, there are 5 white dots on a black background, there is a VoiceOver preview with the following text: 'There are 5 white dots on a black background. Press up to increase the number or down to decrease the number'" src="./sample.png" />

## Motivation

This template gives developers an easy and cross-platform interface for interacting with Screen Readers, using browser-based APIs. The browser-based support means that Blind and Low-Vision users can use installed Screen Readers (like NVDA and VoiceOver) that they are most comfortable with, with all the configurations they are used to.

This was specifically created for [Ladybud Roll](https://jrjurman.itch.io/ladybud-roll), an entry in the [Games for Blind Gamers](https://itch.io/jam/games-for-blind-gamers-4) game jam.

## Requirements

This depends on you being able to export your game with [love.js](https://github.com/Davidobot/love.js).

## What is it?

There are three files included in this project that you can copy or reference for your own project. In-part, these are based on the [love2d-electron-template](https://github.com/JRJurman/love2d-electron-template), and allow you to have both a web export, and a standalone distributable.

<dl>

<dt><code>template.html</code></dt>
<dd>

This is a modified template for love.js, and the core part of this project. This template adds a live aria element to read out any text to screen readers that has been printed with `print('tts:')`. For low-vision users that need pinch-zoom capabilities, we've also disabled the `wheel` event handlers on the canvas that were disabling that.Additionally, this centers and expands the default frame of the game canvas.

</dd>

<dt><code>index.js</code></dt>
<dd>This is the javascript entrypoint for the electron app (if you choose to make a standalone distributable). This will run the hosted instance of the love.js project.</dd>

<dt><code>build.sh</code></dt>
<dd>This is a set of scripts that you'll want to run to build the final project. You can either trigger this as a shell script, or include it as part of some other build tooling (or even a package.json).</dd>

</dl>

## How To Use the Screen Reader output

Throughout the development process, add `print` statements with the `tts:` prefix.

```lua
function love.load()
  print("tts:New Game Started!")
end
```

These will be consumed by the html template to be read out by screen readers.


## How to Run your game

After you copy the above files into the root folder of your project, you can start the game in either a web browser or as a standalone app.

### Web Instance

```sh
./build.sh FOLDER_NAME
npx serve FOLDER_NAME
```

Where `FOLDER_NAME` is whatever folder you want to create with `love.js`.

### Standalone Instance

To run as an electron app, you can use similar steps as above, instead running the following:

```sh
./build.sh FOLDER_NAME
npx electron FOLDER_NAME
```

To build a standalone executable, follow the instructions in [here](https://github.com/JRJurman/love2d-electron-template?tab=readme-ov-file#packaging-your-project).

## Sample

You can check out the sample project in the folder in this project, which has gone through all the above steps.

## Suggestions / PRs

If there are accessibility issues with the template, or ways we could make the experience here more straight-forward, feel free to create issues on this repo, start a Discussion, or provide PRs!

Developers should consider this project a starting point and reference on how to build LÖVE games with screen reader support. PRs that don't serve to directly enhance accessibility features may be rejected, although feel free to post them to start the discussion or for reference of other folks who are looking to work with this template.

The packaging and use of electron in this template is secondary, and may change in the future. The use of love.js is tightly coupled here, but feel free to start a Discussion in this repo on alternatives, or use the building blocks here for your own project.
