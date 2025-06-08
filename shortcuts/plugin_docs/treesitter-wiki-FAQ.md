# Differences between tree-sitter and LSP

(For now this is just a copy paste from [this comment](https://github.com/nvim-treesitter/nvim-treesitter/issues/484#issuecomment-694388223))

The take home message is:

> LSP gathers accurate information slowly, while tree-sitter gathers (fairly good) approximations really fast

## tree-sitter

- A library: meaning you can bundle it fairly easily (as long as you load the parsers correctly), and it is just a C function call away
- Made for parsing files : meaning all the information you will get will come from that one file (but you can still do some searches through it)
- Incrementally: this is meant to parse really really fast, while initial parsing will go as usual, incremental parsing will go fast
- With error recovery: that is worth a book, but that's what makes tree-sitter awesome, any syntax error will not mess up the highlighting of the whole file, and truly allow parsing on _every_ keystroke
- Open-source: we can fork it, and just maintain it ourselves, there has already been some PRs from us

## LSP

- A protocol: you implement the protocol on both ends (editor, and language) and it "just" works, but at the cost of roundtrips between LSP client and server
- Made for managing projects: across multiple files then, so that needs indexing, etc etc, and it takes some time
- Made for VSCode: and the spec follows what VSCode needs, and what MS wants

# Polyglot vs nvim-treesitter

They can be used at the same time complementing each other.
nvim-treesitter replaces the usage of syntax files from supported languages, while polyglot provides other plugins in addition and syntax files for languages that aren't supported by nvim-treesitter yet.

# Troubleshooting

## Treesitter reports problems finding a library

Treesitter will build the individual languages and some of them link dynamically to other libraries like libstdc++ if those change or move after they are built you will need to get neovim to rebuild them. The way I figured out how to fix it is to run
```bash
$ rm -rf ~/.local/share/nvim/site/parser
```
The exact location may be different on different installs.
