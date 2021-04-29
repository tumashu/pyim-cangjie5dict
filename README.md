Note: this file is auto converted from pyim-cangjiedict.el by [el2org](https://github.com/tumashu/el2org), please do not edit it by hand!!!

- [pyim-cangjiedict README](#orgfdac9ef)
  - [简介](#org60736e5)
  - [安装和使用](#org420eb51)


<a id="orgfdac9ef"></a>

# pyim-cangjiedict README


<a id="org60736e5"></a>

## 简介

pyim-cangjiedict 是 pyim 的一个倉頡输入法词库。

第一版词库仅支持倉頡五代，故名称为`pyim-cangjie5dict`，后续加入了六代词库，更名为`pyim-cangjiedict`。

其中五代词库修改自 [rime-cangjie](https://github.com/rime/rime-cangjie) 项目。源于《五倉世紀》。 六代（蒼頡檢字法）词库修改自 [rime-cangjie6](https://github.com/rime-aca/rime-cangjie6) 项目。


<a id="org420eb51"></a>

## 安装和使用

1.  配置melpa源，参考：<http://melpa.org/#/getting-started>
2.  M-x package-install RET pyim-cangjie5dict RET
3.  在emacs配置文件中（比如: ~/.emacs）添加如下代码：

        (require 'pyim-cangjie5dict)
        (setq pyim-default-scheme 'cangjie)
        ;; 以下命令可任选其一：
        ;; (pyim-cangjie5dict-enable) ;; 启用五代词库
        ;; (pyim-cangjie6dict-enable) ;; 启用六代词库
