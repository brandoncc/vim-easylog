# vim-easylog

 `<leader>l` to wrap log sentence. You just need to put your cursor on the word you’d like to log, or select that in visual mode.

[中文版本](https://github.com/joeyZhouYicheng/vim-easylog/blob/master/easylog%20-%20%E4%B8%AD%E6%96%87readme.md)

## Quick Start

-   `<leader>l` to wrap log sentence under current line.

-   `<leader>L` to log it at upper line.

-   `<leader>tl` to log variable's type, under current line.

-   `<leader>tL` to log variable's type, at upper line.

Inspired by [wrap-console-log](https://marketplace.visualstudio.com/items?itemName=midnightsyntax.vscode-wrap-console-log).

## Supported languages

Suppose we’d like to print variable `a`

-   javascript

```js
// <leader>l
console.log("a", a)

// <leader>tl
console.log("a: ", Object.prototype.toString.call(a))
```

-   golang

```go
fmt.Println("a", a)
fmt.Printf("a: %T\n", a)
```

-   python

```python
print("a", a)
print("a: ", type(a))
```

-   vimscript

```vim
echo "a: "a
echom "a: ".type(a)
```

## Customization

To change a map, add a `let` statement in your `vimrc`. Example: 

>    let g:easy_log_map_key = "<leader><leader>l"

Default set:

>   let g:easy_log_map_key = "<leader>l"
>
>   let g:easy_log_upper_configuration_map = "<leader>L"
>
>   let g:easy_log_type_map_key='<leader>tl'
>
>   let g:easy_log_type_upper_map_key='<leader>tL'

You Could remap it to your favourite key.

### Adding languages

If you would like to support more languages, you can use the
`g:easy_log_log_map` and `g:easy_log_type_map` variables. For example, to add Ruby:

```viml
let g:easy_log_log_map={
      \'ruby':['puts "', ': " + ', ''],
      \}

let g:easy_log_type_map={
      \'ruby':['puts "', '.class: " + ', '.class.to_s'],
      \}
```

The variables should each be assigned a dictionary. The dictionary keys are the
languages (filetypes), and the assigned values are arrays.

Each array can have any number of elements. These elements are `join`ed with the variable name.
If we take the Ruby example, and the variable name is `first_name`, the output looks like this:

```
first_name = "Alice"
puts "first_name: " + first_name
```

and if you use the type logger instead, it looks like:

```
first_name = "Alice"
puts "first_name.class: " + first_name.class.to_s
```

#### Bonus: Overriding the supported languages

You can also override the output for each of the supported languages that ship with the plugin by adding the same languages to your own configuration. See [the implementation](plugin/easylog.vim) for a starting point. 

## Bugs

If you find a bug, please post it on the issue tracker:

<https://github.com/joeyZhouYicheng/vim-easylog/issues>
