# Code Blocks

Raw data being used:

````text
# Code Blocks

```python
def main() -> None:
    print("Hello, World!")
```

```rust
fn main() {
    println!("Hello, World!");
}
```
````

## Default

[[/images/code/default.png|Default]]

```lua
require('render-markdown').setup({
    code = {
        enabled = true,
        render_modes = false,
        sign = true,
        style = 'full',
        position = 'left',
        language_pad = 0,
        language_icon = true,
        language_name = true,
        disable_background = { 'diff' },
        width = 'full',
        left_margin = 0,
        left_pad = 0,
        right_pad = 0,
        min_width = 0,
        border = 'hide',
        above = '▄',
        below = '▀',
        inline_left = '',
        inline_right = '',
        inline_pad = 0,
        highlight = 'RenderMarkdownCode',
        highlight_language = nil,
        highlight_border = 'RenderMarkdownCodeBorder',
        highlight_fallback = 'RenderMarkdownCodeFallback',
        highlight_inline = 'RenderMarkdownCodeInline',
    },
})
```

## No Sign

[[/images/code/no-sign.png|No Sign]]

```lua
require('render-markdown').setup({
    code = { sign = false },
})
```

## Normal

[[/images/code/normal.png|Normal]]

```lua
require('render-markdown').setup({
    code = { style = 'normal' },
})
```

## Language

[[/images/code/language.png|Language]]

```lua
require('render-markdown').setup({
    code = { style = 'language' },
})
```

## Block

[[/images/code/block.png|Block]]

```lua
require('render-markdown').setup({
    code = {
        width = 'block',
        left_pad = 2,
        right_pad = 4,
    },
})
```

## Block Min

[[/images/code/block-min.png|Block Min]]

```lua
require('render-markdown').setup({
    code = {
        width = 'block',
        min_width = 45,
    },
})
```

## Block Min Left

[[/images/code/block-min-left.png|Block Min Left]]

```lua
require('render-markdown').setup({
    code = {
        width = 'block',
        min_width = 45,
        left_pad = 2,
        language_pad = 2,
    },
})
```

## Block Center

[[/images/code/block-center.png|Block Center]]

```lua
require('render-markdown').setup({
    code = {
        width = 'block',
        left_margin = 0.5,
        left_pad = 0.2,
        right_pad = 0.2,
    },
})
```

## Right

[[/images/code/right.png|Right]]

```lua
require('render-markdown').setup({
    code = {
        position = 'right',
        width = 'block',
        right_pad = 10,
    },
})
```

## Thick

[[/images/code/thick.png|Thick]]

```lua
require('render-markdown').setup({
    code = {
        style = 'normal',
        border = 'thick',
    },
})
```
