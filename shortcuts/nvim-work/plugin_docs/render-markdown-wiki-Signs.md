# Signs

Raw data being used:

````text
# Signs

```lua
print('Hello, World!')
```
````

## Default

[[/images/sign/default.png|Default]]

```lua
require('render-markdown').setup({
    sign = {
        enabled = true,
        highlight = 'RenderMarkdownSign',
    },
})
```

## Disabled

[[/images/sign/disabled.png|Disabled]]

```lua
require('render-markdown').setup({
    sign = { enabled = false },
})
```
