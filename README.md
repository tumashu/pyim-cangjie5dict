Note: this file is auto converted from pyim-cangjiedict.el by [el2org](https://github.com/tumashu/el2org), please do not edit it by hand!!!

- [pyim-cangjiedict README](#org2d86806)
  - [簡介(Introduction)](#org2427508)
  - [安裝和使用(Installation)](#org77d29b1)


<a id="org2d86806"></a>

# pyim-cangjiedict README


<a id="org2427508"></a>

## 簡介(Introduction)

pyim-cangjiedict 是 pyim 的一個倉頡輸入法詞庫。

pyim-cangjiedict is a dict of Cangjie input scheme for [pyim](<https://github.com/tumashu/pyim>).

第一版詞庫僅支持倉頡五代，故名稱爲`pyim-cangjie5dict`，後續加入了六代詞庫，更名爲`pyim-cangjiedict`。

The first version of the project only supported the Cangjie v5, so the name is `pyim-cangjie5dict`, and version 6th was subsequently added and renamed `pyim-cangjiedict`.

其中五代詞庫修改自 [rime-cangjie](https://github.com/rime/rime-cangjie) 項目，源於《五倉世紀》。

六代（蒼頡檢字法）詞庫修改自 [rime-cangjie6](https://github.com/rime-aca/rime-cangjie6) 項目。

The cangjie5dict is modified from the [rime-cangjie](https://github.com/rime/rime-cangjie) project. And the cangjie6dict is modified from the [rime-cangjie6](https://github.com/rime-aca/rime-cangjie6) project.


<a id="org77d29b1"></a>

## 安裝和使用(Installation)

1.  配置melpa源，參考：<http://melpa.org/#/getting-started>
2.  M-x package-install RET pyim-cangjiedict RET
3.  在emacs配置文件中（比如: ~/.emacs）添加如下代碼：

        (require 'pyim-cangjiedict)
        (setq pyim-default-scheme 'cangjie)
        ;; 以下命令可任選其一：
        ;; (pyim-cangjie5dict-enable) ;; 啓用五代詞庫(Enable cangjie5)
        ;; (pyim-cangjie6dict-enable) ;; 啓用六代詞庫(Enable cangjie6)
