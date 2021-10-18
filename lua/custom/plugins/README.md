# Installing Language Servers

**How to install the LSPS used in my configuration.**

- [Documentation](https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md) for NeoVim's language server protocol as well as additional information about defaults, more langauge servers, etc. 



### bashls


https://github.com/bash-lsp/bash-language-server

- Language server for Bash 

The `bash language server` can be installed with `npm`:

```sh
npm i -g bash-language-server
```

### cssls

https://github.com/hrsh7th/vscode-langservers-extracted

- Language server for css 

`css-languageserver` can be installed via `npm`:

```sh
npm i -g vscode-langservers-extracted
```


### html

https://github.com/hrsh7th/vscode-langservers-extracted

- Language server for html

`vscode-html-language-server` can be installed via `npm`:

```sh
npm i -g vscode-langservers-extracted
```

### pyright

https:///github.com/microsoft/pyright 

- `pyright` is a static type checker and language server for python

`pyright` can be installed via `npm`:

```sh
npm i -g pyright
```

### tsserver

https://github.com/theia-ide/typescript-language-server

- `typescript-language-server` depends on `typescript`. Both packages can be installed via `npm`:

```sh
npm i -g typescript typescript-language-server
```

### sumneko_lua

https://github.com/sumneko/lua-language-server

`lua-language-server` has to be built from source

  **Building it:**
> Note: I will probably write a script for this later.

1. Install [ninja](https://github.com/ninja-build/ninja/wiki)
2. Make sure you have C++17
3. Clone project
```sh
cd /tmp
# cloning project
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive
```
4. Build
+ `Linux`:
```shell
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

+ `macOS`:
```shell
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
```

5. Run/Finalize
+ `Linux`:
```shell
# move the compiled language-server
mkdir -p ~/.lsps
cd /tmp
mv lua-language-server ~/.lsps
# to execute it 
./bin/Linux/lua-language-server
```
+ `macOS`:
```shell
# move the compiled language-server
mkdir -p ~/.lsps
cd /tmp
mv lua-language-server ~/.lsps 
# to execute it
./bin/macOS/lua-language-server
```
