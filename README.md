### pyim-cangjie5dict ###

pyim-cangjie5dict 是 pyim 的一个倉頡五代词库，修改自 RIME 项目。源于《五倉世紀》。

#### 安装与使用 ####

1. 配置 melpa 源，可参考[ELPA 镜像](https://elpa.emacs-china.org/)
2. 安装 pyim 及本词库（M-x `package-install` RET `pyim-smzmdict` RET）；
3. 在 .emacs 中加入如下代码以启用：

```elisp
(require 'pyim-cangjie5dict)
(pyim-cangjie5dict-enable)
```
