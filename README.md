# hLuaCows

*hLuaCows* is a variant of the ["Bulls & Cows" game](https://en.wikipedia.org/wiki/Bulls_and_Cows), implemented using:

- Haskell for the UI (with library [Dialogui](https://github.com/astynax/dialogui))
- Lua for the game logic

## Installation

```shell
$ git clone <repo>
$ cd hluacows
$ stack install
```

and then

```haskell
$ hluacows
```

*Note:* the game's GUI requires installed Tk. You can have it with ``sudo apt-get install tk`` or the other way (native for your OS).
