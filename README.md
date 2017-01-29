# myvim
My Vim configuration

# Installation
You can just clone the repository and create a link to downloaded directory:

```bash
git clone https://github.com/aminfara/myvim.git
ln -s myvim ~/.vim
vim
```

# Key bindings
Mode | Key | Function
---- | --- | --------
n | <C-L> | clears search highlight (by sensible)
i | <C-U> | undo in insert mode (by sensible)
n, v | <Leader>s | easymotion search

Plus all default mappings for loaded modules. Here are some examples:

Mode | Key | Function
---- | --- | --------
n, v | <Leader><Leader>w | easymotion word motion
n, v | <Leader><Leader>j | easymotion line down motion
n, v | <Leader><Leader>k | easymotion line up motion
n, v | <Leader><Leader>b | easymotion word backward motion
n | cs | change surrounding
n | ds | delete surrounding
n | ys | insert surrounding
n | <Leader>fb | FZF Buffers
n | <Leader>fc | FZF Commands
n | <Leader>ff | FZF Files
n | <Leader>fh | FZF File history
n | <Leader>fl | FZF Lines
n | <Leader>fm | FZF Maps
n | <Leader>fs | FZF Ag
n | <Leader>ft | FZF Tags
n | <Leader>fw | FZF Ag word under cursor


# Development
## Todo
* easymotion - done
* Good status bar - Using airline - done
* Surround - done
* Project fuzzy find - Using FZF - done
* Find in project (grep, ag, ...) - Using FZF - done
* lazy loading
* Mnemonic shortcuts
* Syntax highlighting
* Smart Indentation
* Indentation guide
* Tags
* Autocompletion (all buffers, tags, ...)
* Lint
* Jump to test file
* Beautify
* Multi-cursor (sublime like behavior)
* Spell-checking
* Available keys (Maybe)
* Snippets
* Autosave
* jk jump to normal mode
* Bracket highlighting
* git support
* git gutter
* Move line up and down (sublime like)
* Block select (per language type)
* Persistent undo
* Languages to support
  * Python
  * Ruby
  * HTML
  * HAML
  * CSS
  * SASS
  * Javascript
  * Coffescript
  * Markdown
  * YAML
