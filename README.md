cygroonga
=========

* Python binding for [groonga](https://github.com/groonga/groonga) implemented with [Cython](http://cython.org/).
* This library is work in progress. Just started.
* API are not frozen yet.
* I will implement only APIs which I use.

## How to build

### MacPorts

```
sudo port install groonga
CFLAGS=-I/opt/local/include LDFLAGS=-L/opt/local/lib make
```

### Homebrew

```
brew install groonga
make
```

## License

* cygroonga: [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
* [groonga](https://github.com/groonga/groonga): [LGPL 2.1](https://github.com/groonga/groonga/blob/master/COPYING)
