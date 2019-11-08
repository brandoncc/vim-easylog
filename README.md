# vim-easylog
`<leader>l` to wrap log sentence.

chinese vertion

## Quick Start

- `<leader>l` to wrap log sentence.
- `<leader>L` to print it at upper line.

- `<leader>tl` to log variable's type
- `<leader>tL` to print variable's type, at upper line.

Inspired by [wrap-console-log](https://marketplace.visualstudio.com/items?itemName=midnightsyntax.vscode-wrap-console-log).

## Supported languages

(print variable a as an example)

- javascript
  `console.log()`

![image-20191102203820373](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz6oaqhpj304b00wdfp.jpg)

`<leader>l`:

![image-20191102203836994](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz6x9k0hj306001idfs.jpg)

`<leader>L`

![image-20191102203956540](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz8awtlhj305q01maa0.jpg)

`<leader>tl`/`<leader>tL`

```js
console.log("a: ", Object.prototype.toString.call(a))
```

- golang
  `fmt.Println()`
  `fmt.Printf("a: %T\n", a)`

![image-20191102204253328](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jzbddc9rj305g01gt8m.jpg)

- python
  `print()`
  `print("a: ", type(a))`

![image-20191102204336708](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jzc4jb6oj303o0133ye.jpg)

- vimscript
  `echo “a: ”a`
  `echom "a: ".type(a)`


## Customerization

To change a map, add a |let| statement in your |vimrc|. Example: 

>    let g:easy_log_map_key = "<leader><leader>l"



Default set:

>   let g:easy_log_map_key = "<leader>l"
>
>   let g:easy_log_upper_configuration_map = "<leader>L"
>
>   let g:easy_log_type_map_key='<leader>tl'
>
>   let g:easy_log_type_upper_map_key='<leader>tL'
>

You Could remap it to your favourite key.

## Bugs

If you find a bug, please post it on the issue tracker:

https://github.com/joeyZhouYicheng/vim-easylog/issues