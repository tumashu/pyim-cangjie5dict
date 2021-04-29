Note: this file is auto converted from pyim-cangjie5dict.el by [el2org](https://github.com/tumashu/el2org), please do not edit it by hand!!!

- [pyim-cangjie5dict README](#org304fdc8)
  - [简介](#orgc5661be)
  - [安装和使用](#org1155c7a)


<a id="org304fdc8"></a>

# pyim-cangjie5dict README


<a id="orgc5661be"></a>

## 简介

pyim-cangjie5dict 是 pyim 的一个倉頡输入法词库。

第一版词库仅支持倉頡五代，故名称为`pyim-cangjie5dict`，后续加入了六代词库。考虑到 melpa 的使用，暂不更名。

其中五代词库修改自 [rime-cangjie](https://github.com/rime/rime-cangjie) 项目。源于《五倉世紀》。 六代（蒼頡檢字法）词库修改自 [rime-cangjie6](https://github.com/rime-aca/rime-cangjie6) 项目。


<a id="org1155c7a"></a>

## 安装和使用

1.  配置melpa源，参考：<http://melpa.org/#/getting-started>
2.  M-x package-install RET pyim-cangjie5dict RET
3.  在emacs配置文件中（比如: ~/.emacs）添加如下代码：

        (require 'pyim-cangjie5dict)
        (setq pyim-default-scheme 'cangjie)
        ;; 以下命令可任选其一：
        ;; (pyim-cangjie5dict-enable) ;; 启用五代词库
        ;; (pyim-cangjie6dict-enable) ;; 启用六代词库
