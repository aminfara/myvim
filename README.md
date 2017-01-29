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

Plus all easymotion default mappings start with <leader><leader> for all sorts of motions.


# Development
## Todo
* easymotion - done
* Good status bar - Used airline - done
* lazy loading
* Mnemonic shortcuts
* Syntax highlighting
* Smart Indentation
* Indentation guide
* Tags
* Autocompletion (all buffers, tags, ...)
* Lint
* Jump to test file
* Project fuzzy find
* Find in project (grep, ag, ...)
* Beautify
* Multi-cursor (sublime like behavior)
* Spell-checking
* Available keys (Maybe)
* Snippets
* Autosave
* jk jump to normal mode
* Bracket highlighting
* Surround
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
