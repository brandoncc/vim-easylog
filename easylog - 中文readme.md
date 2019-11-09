# easylog - 中文readme

光标放在单词上，或用visual选中，输入`<leader>l`来自动生成log语句

[English version](https://github.com/joeyZhouYicheng/vim-easylog/blob/master/easylog%20-%20%E4%B8%AD%E6%96%87readme.md)

## 快速上手

-   `<leader>l` ，生成在下方

-   `<leader>L` ，生成在上方

-   `<leader>tl` ， 生成打印变量类型的log

-   `<leader>tL`，变量类型log生成在上方

灵感源自[wrap-console-log](https://marketplace.visualstudio.com/items?itemName=midnightsyntax.vscode-wrap-console-log).

## 已支持的语言

假设我们需要打印的变量是`a`

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

## 重新映射

如果想修改映射的按键，你只需在`.vimrc`里面加上相应的设定。例如：

>     let g:easy_log_map_key = "<leader><leader>l"

默认值如下：

> let g:easy_log_map_key = "<leader>l"



let g:easy_log_upper_configuration_map = "<leader>L"

let g:easy_log_type_map_key='<leader>tl'

let g:easy_log_type_upper_map_key='<leader>tL'


你可以将它们改成你喜欢的键位

## bug

如果有发现任何bug，麻烦给我提issue，我会尽力解决的：

<https://github.com/joeyZhouYicheng/vim-easylog/issues>
