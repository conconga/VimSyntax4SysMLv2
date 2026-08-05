# SysML v2 syntax highlighting for Vim

This repository provides a standalone Vim syntax file for SysML v2 text
models, including the KerML foundation. It has no JavaScript, Lua, Node.js, or
other runtime dependencies.

The syntax definition highlights:

- KerML and SysML v2 keywords
- predefined scalar types, Boolean values, and `null`
- quoted names, strings, escape sequences, and invalid escapes
- integer, floating-point, hexadecimal, binary, and multiplicity literals
- operators, delimiters, metadata annotations, and comments
- relationship shorthand (`:>` and `:>>`) and arrow operators such as `->`,
  `->>`, `-->>`, `<-`, `<<-`, `<->`, and `=>`

## Installation

### Copy the syntax file

Create Vim's user syntax directory and install the file under the name used by
the `sysmlv2` file type:

```sh
mkdir -p ~/.vim/syntax
cp sysmlv2.vim ~/.vim/syntax/sysmlv2.vim
```

Then add file-type detection for SysML files to `~/.vimrc`:

```vim
syntax enable
augroup sysmlv2_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.sysml setfiletype sysmlv2
augroup END
```

### Source from `.vimrc`

Alternatively, keep the syntax file in this repository and source it directly
from `~/.vimrc` (replace the path as needed):

```vim
syntax enable
autocmd BufRead,BufNewFile *.sysml source /path/to/sysmlv2_vim/sysmlv2.vim
```

## Testing

To try the highlighter without changing your Vim configuration, open a SysML
v2 file with a clean Vim session:

```sh
vim --clean -Nu NONE -c 'syntax on' -c 'source sysmlv2.vim' model.sysml
```

## Reference

This project uses
[EthanJamesLew/sysmlv2.nvim](https://github.com/EthanJamesLew/sysmlv2.nvim)
as a reference and starting point. It is included as a Git submodule, but the
submodule does not need to be initialized to use `sysmlv2.vim`.

