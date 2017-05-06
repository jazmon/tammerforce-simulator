turbo-waddle
============

Practice project for learning Elm by creating a "[Tammerforce](https://tammerforce.com) Simulator" at the [Futurice](https://futurice.com) Code Camp 2017.

Made on top of [`elm-webpack-starter`](https://github.com/moarwick/elm-webpack-starter).


### Install:
Clone this repo into a new project folder, e.g. `turbo-waddle`:
```
git clone https://github.com/moarwick/elm-webpack-starter turbo-waddle
cd turbo-waddle
```

Install all dependencies using the handy `reinstall` script:
```
npm run reinstall
```

*This does a clean (re)install of all npm and elm packages, plus a global elm install.*


### Serve locally:
```
npm start
```
* Access app at `http://localhost:8080/`
* Get coding! The entry point file is `src/elm/Main.elm`
* Browser will refresh automatically on any file changes..


### Build & bundle for prod:
```
npm run build
```

* Files are saved into the `/dist` folder
* To check it, open `dist/index.html`
