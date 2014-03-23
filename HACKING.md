# Hacking

This project is written in Haskell with [Yesod](http://www.yesodweb.com/) as the framework. This means you'll need the [Haskell Platform](http://www.haskell.org/platform/) to run it.

After cloning the project and installing the Haskell Platform, you can setup the required dependencies with

```
$ cabal sandbox init
$ cabal install yesod
```

This will download and build Yesod, and place binaries in the `.cabal-sandbox/bin` folder. In order to run the `yesod` binary, you will then have to reference its location in this `bin`---or just add `./.cabal-sandbox/bin` to your `$PATH`.

A smarter way to do this is to use [`cabal-dev`](http://www.haskell.org/haskellwiki/Cabal-dev). It helps automate some of the cruft associated with using cabal sandboxes, meaning you won't have to manually add the `bin` folder to your `$PATH` every time you want to work.

For getting started on Yesod in general, you should read the [book](http://www.yesodweb.com/book). Frontend stuff mostly just needs the [Shakespearean Templates](http://www.yesodweb.com/book/shakespearean-templates) chapter, which covers the way HTML/CSS/JavaScript is written for Yesod projects.
