# easylog - 中文readme

光标放在单词上，或用versial选中，输入`<leader>l`来自动生成log语句

## 快速上手

- `<leader>l` ，生成在下方
- `<leader>L` ，生成在上方
- `<leader>tl` ， 生成打印变量类型的log
- `<leader>tL`，变量类型log生成在上方

## 已支持的语言

假设我们需要打印的变量是`a`

- javascript

```js
// <leader>l
console.log("a", a)

// <leader>tl
console.log("a: ", Object.prototype.toString.call(a))
```

  - golang

```go
fmt.Println("a", a)
fmt.Printf("a: %T\n", a)
```

  - python

```python
print("a", a)
print("a: ", type(a))
```

  - vimscript

```vim
echo "a: "a
echom "a: ".type(a)
```

## 重新映射

在`.vimrc`里面修改对应的快捷键即可，默认设置如下：

```vim
let g:easy_log_map_key = "<leader>l"
let g:easy_log_upper_configuration_map = "<leader>L"

let g:easy_log_type_map_key='<leader>tl'
let g:easy_log_type_upper_map_key='<leader>tL'
```

## bug

如果有发现任何bug，麻烦给我提issue，我会尽力解决的：

https://github.com/joeyZhouYicheng/vim-easylog/issues