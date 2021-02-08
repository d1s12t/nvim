##  快捷键
### 基本快捷键

| 快捷键   | 模式   | 作用                     |
|----------|--------|--------------------------|
| Q        | normal | 退出编辑器               |
| W        | normal | 保存                     |
| so       | normal | 修改，替代原来的s        |
| 空格rc   | normal | 编辑nvim配置文件         |
| re       | normal | 重新载入配置文件         |
| Y        | normal | 复制当前行               |
| Y        | visul  | 复制选中内容到系统剪切板 |
| <        | normal | 删除一个缩进             |
| >        | normal | 增加一个缩进             |
| 空格回车 | normal | 取消搜索高亮             |

### 光标移动
| 快捷键 | 模式   | 作用           |
|--------|--------|----------------|
| alt-h  | all    | 向左移动光标   |
| alt-j  | all    | 向下移动光标   |
| alt-k  | all    | 向上移动光标   |
| alt-l  | all    | 向右移动光标   |
| ctrl-a | all    | 移动光标到行首 |
| ctrl-e | all    | 移动光标到行尾 |
| H      | normal | 向左移动5光标  |
| J      | normal | 向下移动5光标  |
| K      | normal | 向上移动5光标  |
| L      | normal | 向右移动5光标  |

### 分屏

| 快捷键 | 模式   | 作用                       |
|--------|--------|----------------------------|
| 空格sl | normal | 向右分屏并移动焦点到右边   |
| 空格sh | normal | 向右分屏并不移动焦点到右边 |
| 空格sj | normal | 向下分屏并移动焦点到下边   |
| 空格sl | normal | 向下分屏并不移动焦点到下边 |


### 窗口间移动光标
| 快捷键 | 模式   | 作用               |
|--------|--------|--------------------|
| 空格h  | normal | 向左边窗口移动光标 |
| 空格j  | normal | 向下边窗口移动光标 |
| 空格k  | normal | 向上边窗口移动光标 |
| 空格l  | normal | 向右边窗口移动光标 |

### 标签页支持
| 快捷键 | 模式   | 作用                 |
|--------|--------|----------------------|
| tn     | normal | 创建标签页           |
| th     | normal | 移动焦点到左边标签页 |
| tl     | normal | 移动焦点到右边标签页 |
| Q      | normal | 关闭当前标签页       |

### git集成
| 快捷键 | 模式   | 作用        |
|--------|--------|-------------|
| ctrl-g | normal | 打开lazygit |


### 书签支持
| 快捷键 | 模式   | 作用                   |
|--------|--------|------------------------|
| mt     | normal | 在当前行添加或删除书签 |
| ma     | normal | 在当前行添加注释       |
| ml     | normal | 显示所有的书签         |
| mi     | normal | 下一个书签             |
| mn     | normal | 上一个书签             |
| mC     | normal | 清除一个书签           |
| mX     | normal | 清除所有书签           |
| mu     | normal | 将书签往上提一行       |
| me     | normal | 将书签往下拉一行       |
| 空格   | normal | 将书签移动到任意一行   |

### 文件信息
| 快捷键 | 模式   | 作用                 |
|--------|--------|----------------------|
| \p     | normal | 显示当前文件完整路径 |

## 插件快捷键

### 多光标支持
[vim-visual-multi](https://github.com/mg979/vim-visual-multi) 
 
| 快捷键            | 模式   | 作用                         |
|-------------------|--------|------------------------------|
| Ctrl-N            | normal | 添加光标到下一个相同的单词   |
| Ctrl-Down/Up      | normal | 垂直添加光标                 |
| n/N               | normal | 获取下一个                   |
| [/]               | normal | 选择下一个光标               |
| q                 | normal | 忽略当前光标并且获取下一个   |
| Q                 | normal | 移除当前光标                 |
| ctrl-鼠标左键     | normal | 添加当前点击位置光标         |
| ctrl-鼠标右键     | normal | 添加当前点击位置所在单词光标 |
| ctrl-alt-鼠标右键 | normal | 添加两次点击之间多行光标           |

### 模糊查找
[fzf](https://github.com/junegunn/fzf "github地址")
| 快捷键 | 模式   | 作用         |
|--------|--------|--------------|
| ctrl-c | normal | 查找文件内容 |
| ctrl-h | normal | 查找历史     |
| ctrl-b | normal | 查找buffer   |
| ctrl-j | fzf    | 下一条       |
| ctrl-k | fzf    | 上一条       |


[leaderf](https://github.com/vim-scripts/LeaderF "github地址")
| 快捷键              | 模式    | 作用                                   |
|---------------------|---------|----------------------------------------|
| ctrl-p              | normal  | 查找文件名                             |
| ctrl-c              | leaderf | 退出leaderf                            |
| ctrl-f              | leaderf | 切换完整路径搜索模式和仅文件名搜索模式 |
| ctrl-v              | leaderf | 从剪切板粘贴                           |
| ctrl-u              | leaderf | 清除输入                               |
| ctrl-k/j \| UP/Down | leaderf | 上/下一条                              |

### coc
#### 代码导航
| 快捷键 | 模式   | 作用                 |
|--------|--------|----------------------|
| gd     | normal | 跳转到定义           |
| gi     | normal | 跳转到实现           |
| gr     | normal | 跳转到引用           |
| gty    | normal | 跳转到类型定义       |
| gne    | normal | 跳转到下一个错误诊断 |
| gle    | normal | 跳转到上一个错误诊断 |
| rn     | normal | 重命名变量           |
### 文件浏览
| 快捷键 | 模式   | 作用                      |
|--------|--------|---------------------------|
| 空格ed | normal | 以侧栏方式打开文件浏览器  |
| 空格ef | normal | 以悬浮模式打开文件浏览器  |
| 空格ec | normal | 打开cocConfig配置目录     |
| 空格eb | normal | 在文件浏览器中打开buffers |

### 代码片段
| 快捷键 | 模式          | 作用                             |
|--------|---------------|----------------------------------|
| ctrl-j | insert        | 在一个代码片段中移动到下一个位置 |
| ctrl-k | insert        | 在一个代码片段中移动到上一个位置 |
| 空格x  | visual/visual | 添加选中代码到代码片段           |



### coc 查找
| 快捷键  | 模式   | 作用     |
|---------|--------|----------|
| 空格cld | normal | 查找诊断 |
| 空格cle | normal | 查找插件 |
| 空格clo | normal | 查找     |




#### 其他coc功能
| 快捷键 | 模式          | 作用                 |
|--------|---------------|----------------------|
| 空格0  | normal        | 预览窗口查看帮助文档 |
| 空格f  | normal/visual | 格式化选中代码       |
| ts     | normal        | 翻译当前光标所在单词 |


### 代码调试
[vimspector](https://github.com/puremourning/vimspector "github地址")

| 快捷键 | 模式   | 作用                                       |
|--------|--------|--------------------------------------------|
| F5     | normal | 继续调试，如果不在一个调试中则开始进行调试 |
| F3     | normal | 终止调试                                   |
| F4     | normal | 用相同的配置重新开始调试                   |
| F6     | normal | 暂停调试                                   |
| F9     | normal | 在当前行上切换行的断点                     |
| F8     | normal | 在光标下为表达式添加函数断点               |
| F10    | normal | 完成步骤                                   |
| F11    | normal | 下一步骤                                   |


### markdown支持
| 快捷键 | 模式   | 作用                    |
|--------|--------|-------------------------|
| ]b     | insert | 粗体文字                |
| ]d     | insert | 被划去的文字            |
| ]i     | insert | 斜体文字                |
| ]c     | insert | 单行代码块              |
| ]m     | insert | 多行代码块              |
| ]u     | insert | - [ ] 清单              |
| ]p     | insert | 图片                    |
| ]a     | insert | 链接                    |
| ]1     | insert | # H1                    |
| ]2     | insert | ## H2                   |
| ]3     | insert | ### H3                  |
| ]4     | insert | #### H4                 |
| ]l     | insert | 分割线                  |
| ]f     | insert | 下一个占位符            |
| ]f     | insert | 下一个占位符并按下enter |


### 撤回历史
[undotre|](https://github.com/|mbbill/undotree "github地址")
| 快捷键  | 模式   | 作用         |
|---------|--------|--------------|
| shift-l | normal | 打开撤回历史 |

### 新操作符-使用yank的内容替代(s原来的功能有so替代)
| 操作符 | 作用                         |
|--------|------------------------------|
| s      | 使用yank的内容替代           |
| ss     | 使用yank的内容替代当前行     |
| se     | 使用yank的内容替代光标到行尾 |

### 快速文本对象选择
[wildfire](https://github.com/gcmt/wildfire.vim "github地址")

### 快速包裹文本对象
[surround](https://github.com/tpope/vim-surround "github地址")

