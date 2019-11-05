# vim-easylog
`<leader>l` to wrap log sentence.

## Usage

`<leader>l` to wrap log sentence. `<leader>L` to print it at upper line. 

Inspired by [wrap-console-log](https://marketplace.visualstudio.com/items?itemName=midnightsyntax.vscode-wrap-console-log).



Supported languages:

- javascript
  `console.log()`

![image-20191102203820373](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz6oaqhpj304b00wdfp.jpg)

`<leader>l`:

![image-20191102203836994](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz6x9k0hj306001idfs.jpg)

`<leader>L`

![image-20191102203956540](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jz8awtlhj305q01maa0.jpg)

- golang
  `fmt.Println()`

![image-20191102204253328](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jzbddc9rj305g01gt8m.jpg)

- python
  `print()`

![image-20191102204336708](https://tva1.sinaimg.cn/large/006y8mN6gy1g8jzc4jb6oj303o0133ye.jpg)

- vimscript
  `echom`

![image-20191104213820349](https://tva1.sinaimg.cn/large/006y8mN6gy1g8mc5qbdu7j305001wjrh.jpg)

## Configuration

- `g:easy_log_configuration_map`
  log downside, default `<leader>l`

- `g:easy_log_upper_configuration_map`
  log upperside, default`<leader>L`

## TODO:

- [x] configuration remap
- [ ] deep copy
- [ ] customization
  modify the log sentences