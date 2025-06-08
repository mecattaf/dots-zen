# Links

Raw data being used:

````text
# Links

- ![Image](test.png)
- [Markdown File](test.md)
- [Python File](test.py)
- [Website](https://test.com)
- [[wikilink]]
- [[wikilink|Wikilink Alias]]
- [Reference][example]
- <user@test.com>
````

## Default

[[/images/link/default.png|Default]]

```lua
require('render-markdown').setup({
    link = {
        enabled = true,
        render_modes = false,
        footnote = {
            enabled = true,
            superscript = true,
            prefix = '',
            suffix = '',
        },
        image = '󰥶 ',
        email = '󰀓 ',
        hyperlink = '󰌹 ',
        highlight = 'RenderMarkdownLink',
        wiki = {
            icon = '󱗖 ',
            body = function()
                return nil
            end,
            highlight = 'RenderMarkdownWikiLink',
        },
        custom = {
            web = { pattern = '^http', icon = '󰖟 ' },
            discord = { pattern = 'discord%.com', icon = '󰙯 ' },
            github = { pattern = 'github%.com', icon = '󰊤 ' },
            gitlab = { pattern = 'gitlab%.com', icon = '󰮠 ' },
            google = { pattern = 'google%.com', icon = '󰊭 ' },
            neovim = { pattern = 'neovim%.io', icon = ' ' },
            reddit = { pattern = 'reddit%.com', icon = '󰑍 ' },
            stackoverflow = { pattern = 'stackoverflow%.com', icon = '󰓌 ' },
            wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
            youtube = { pattern = 'youtube%.com', icon = '󰗃 ' },
        },
    },
})
```

## Image Icon

[[/images/link/image-icon.png|Image Icon]]

```lua
require('render-markdown').setup({
    link = { image = '󰋵 ' },
})
```

## Email Icon

[[/images/link/email-icon.png|Email Icon]]

```lua
require('render-markdown').setup({
    link = { email = ' ' },
})
```

## Link Icon

[[/images/link/link-icon.png|Link Icon]]

```lua
require('render-markdown').setup({
    link = { hyperlink = '󰌷 ' },
})
```

## Python Icon

[[/images/link/python-icon.png|Python Icon]]

```lua
require('render-markdown').setup({
    link = {
        custom = {
            python = {
                pattern = '%.py$',
                icon = '󰌠 ',
            },
        },
    },
})
```
