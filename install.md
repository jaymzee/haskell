# installing haskell

install ncurses
```
$ sudo apt install libncursesw5
```

install gmp
```
$ sudo apt install libgmp-dev
```

install ghcup
```
$ curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
```

install System.Random
```
$ cabal install --lib random
```
