core.arity
==========

[![Build Status](https://secure.travis-ci.org/folktale/core.arity.png?branch=master)](https://travis-ci.org/folktale/core.arity)
[![NPM version](https://badge.fury.io/js/core.arity.png)](http://badge.fury.io/js/core.arity)
[![Dependencies Status](https://david-dm.org/folktale/core.arity.png)](https://david-dm.org/folktale/core.arity)
[![stable](http://badges.github.io/stability-badges/dist/stable.svg)](http://github.com/badges/stability-badges)


Restricts the arity of variadic functions.


## Example

```js
var arity = require('core.arity')

[1, -1, 2, -3].reduce(arity.binary(Math.max), 0)
// => 2
```


## Installing

The easiest way is to grab it from NPM. If you're running in a Browser
environment, you can use [Browserify][]

    $ npm install core.arity


### Using with CommonJS

If you're not using NPM, [Download the latest release][release], and require
the `core.arity.umd.js` file:

```js
var arity = require('core.arity')
```


### Using with AMD

[Download the latest release][release], and require the `core.arity.umd.js`
file:

```js
require(['core.arity'], function(arity) {
  ( ... )
})
```


### Using without modules

[Download the latest release][release], and load the `core.arity.umd.js`
file. The properties are exposed in the global `folktale.core.arity` object:

```html
<script src="/path/to/core.arity.umd.js"></script>
```


### Compiling from source

If you want to compile this library from the source, you'll need [Git][],
[Make][], [Node.js][], and run the following commands:

    $ git clone git://github.com/folktale/core.arity.git
    $ cd core.arity
    $ npm install
    $ make bundle
    
This will generate the `dist/core.arity.umd.js` file, which you can load in
any JavaScript environment.

    
## Documentation

You can [read the documentation online][docs] or build it yourself:

    $ git clone git://github.com/folktale/core.arity.git
    $ cd core.arity
    $ npm install
    $ make documentation

Then open the file `docs/index.html` in your browser.


## Platform support

This library assumes an ES5 environment, but can be easily supported in ES3
platforms by the use of shims. Just include [es5-shim][] :)


## Licence

Copyright (c) 2014 Quildreen Motta.

Released under the [MIT licence](https://github.com/folktale/core.arity/blob/master/LICENCE).

<!-- links -->
[Fantasy Land]: https://github.com/fantasyland/fantasy-land
[Browserify]: http://browserify.org/
[Git]: http://git-scm.com/
[Make]: http://www.gnu.org/software/make/
[Node.js]: http://nodejs.org/
[es5-shim]: https://github.com/kriskowal/es5-shim
[docs]: http://folktale.github.io/core.arity
<!-- [release: https://github.com/folktale/core.arity/releases/download/v$VERSION/core.arity-$VERSION.tar.gz] -->
[release]: https://github.com/folktale/core.arity/releases/download/v1.0.0/core.arity-1.0.0.tar.gz
<!-- [/release] -->
