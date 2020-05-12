# Elm + Bulma + Parcel - project template

Template for new projects coded in [Elm] and styled with [Bulma] using [Parcel] to compile and pack
everything up.

## Includes

* [Elm] 0.19.1
* [Elm Test]
* [elm-format]
* [Bulma]
* [Sass] compilation
* [Parcel] hot-reloading and bundling 

Additional goodies:

* [editorconfig]

## Usage

This starter template requires that [Node.js] is installed on your system.

### Create a new project

Clone this repository:

```bash
$ git clone https://github.com/haraldmaida/elm-bulma-parcel-starter.git my-new-project
```

Install the components:

```bash
$ npm install
```

Optionally configure your editor to run [elm-format] on file save.

### Start developing

Start up a server, watching for file changes, compiling for debugging and hot reloading:

```bash
$ npm start
```

Build for debugging (like npm start but without starting a server and without watching for changes):

```bash
$ npm run check
```

Run Elm tests:

```bash
$ npm test 
```

Format Elm source files:

```bash
$ npm run format
```

Build for production:

```bash
$ npm run build
```

## Notes

This template is designed to install [Parcel] and all [Elm] related tools locally (i.e. in the 
project's `node_modules` folder). I prefer this approach over a globally installed toolchain, to be 
able to simultaneously work on older projects which are not migrated to Elm 0.19 (yet). 


[Bulma]: https://bulma.io/
[editorconfig]: https://editorconfig.org/
[Elm]: https://elm-lang.org/
[elm-format]: https://github.com/avh4/elm-format
[Elm Test]: https://package.elm-lang.org/packages/elm-explorations/test/latest
[Node.js]: https://nodejs.org/
[Parcel]: https://parceljs.org/
[Sass]: https://sass-lang.com/
