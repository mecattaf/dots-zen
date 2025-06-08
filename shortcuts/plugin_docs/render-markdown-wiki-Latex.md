# Latex

Raw data being used:

````text
# Latex

$\sqrt{3x-1}+(1+x)^2$

$\sum \epsilon \subset \beta$

$$
f(x,y) = x + \sqrt{y}
f(x,y) = \sqrt{y} + \frac{x^2}{4y}
$$
````

## Default

[[/images/latex/default.png|Default]]

```lua
require('render-markdown').setup({
    latex = {
        enabled = true,
        render_modes = false,
        converter = 'latex2text',
        highlight = 'RenderMarkdownMath',
        position = 'above',
        top_pad = 0,
        bottom_pad = 0,
    },
})
```

## Padding Top

[[/images/latex/padding-top.png|Padding Top]]

```lua
require('render-markdown').setup({
    latex = { top_pad = 1 },
})
```

## Padding Bottom

[[/images/latex/padding-bottom.png|Padding Bottom]]

```lua
require('render-markdown').setup({
    latex = { bottom_pad = 1 },
})
```

## Disabled

[[/images/latex/disabled.png|Disabled]]

```lua
require('render-markdown').setup({
    latex = { enabled = false },
})
```
