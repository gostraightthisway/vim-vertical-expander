# vim-vertical-expander

## 機能 Features

Vim のプラグインで、メソッドチェーン、構造体、および関数の引数を垂直に展開します。
A Vim plugin to vertically expand method chains, structs, and function arguments.

```
app().a(x).b(y).c(z(k))
↓
app()
  .a(x)
  .b(y)
  .c(z(k))
```

```
MyStruct { a:1, b:2, c:3 }
↓
MyStruct { a:1,
  b:2, 
  c:3 }
```

## インストール Instration

vim-plug を使用する場合：
If using vim-plug:

```vim
Plug 'gostraightthisway/vim-vertical-expander'
```

## 使用方法 Usage

メソッドチェーンを展開するには、対象の行を選択し、`:ExpandMethod` コマンドを実行します。
構造体または関数の引数を展開するには、対象の行を選択し、`:Expand` コマンドを実行します。
展開を元に戻すには、対象の行を選択し、`:Condense` コマンドを実行します。
To expand method chains, select the target line(s) and execute the :ExpandMethod command.
To expand structs or function arguments, select the target line(s) and execute the :Expand command.
To condense back, select the target line(s) and execute the :Condense command.
