;;; pyim-cangjiedict.el --- Some cangjie dicts for pyim

;; * Header
;; Copyright (C) 2017 Yuanchen Xie <yuanchen.gm@gmail.com>

;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/p1uxtar/pyim-cangjiedict
;; Version: 0.0.1
;; Package-Requires: ((pyim "3.7"))
;; Keywords: convenience, Chinese, pinyin, input-method, complete

;;; License:

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Commentary:
;; * pyim-cangjiedict README                         :README:doc:
;;
;; ** 简介
;; pyim-cangjiedict 是 pyim 的一个倉頡输入法词库。
;;
;; 第一版词库仅支持倉頡五代，故名称为=pyim-cangjie5dict=，后续加入了六代词库，更名为=pyim-cangjiedict=。
;;
;; 其中五代词库修改自 [[https://github.com/rime/rime-cangjie][rime-cangjie]] 项目。源于《五倉世紀》。
;; 六代（蒼頡檢字法）词库修改自 [[https://github.com/rime-aca/rime-cangjie6][rime-cangjie6]] 项目。
;;
;; ** 安装和使用
;; 1. 配置melpa源，参考：http://melpa.org/#/getting-started
;; 2. M-x package-install RET pyim-cangjie5dict RET
;; 3. 在emacs配置文件中（比如: ~/.emacs）添加如下代码：
;;    #+BEGIN_EXAMPLE
;;    (require 'pyim-cangjiedict)
;;    (setq pyim-default-scheme 'cangjie)
;;    ;; 以下命令可任选其一：
;;    ;; (pyim-cangjie5dict-enable) ;; 启用五代词库
;;    ;; (pyim-cangjie6dict-enable) ;; 启用六代词库
;;    #+END_EXAMPLE
;;
;;; Code:
;; * 代码                                                               :code:
(require 'pyim)

(pyim-scheme-add
 '(cangjie
   :document "倉頡输入法。"
   :class xingma
   :first-chars "abcdefghijklmnopqrstuvwxyz"
   :rest-chars "abcdefghijklmnopqrstuvwxyz"
   :code-prefix "cangjie/" ;仓颉输入法词库中所有的 code 都以 "cangjie/" 开头，防止词库冲突。
   :code-prefix-history ("@") ;仓颉输入法词库曾经使用过的 code-prefix
   :code-split-length 5 ;默认将用户输入切成 5 个字符长的 code 列表（不计算 code-prefix）
   :code-maximum-length 5 ;仓颉词库中，code 的最大长度（不计算 code-prefix）
   :prefer-triggers nil))

;;;###autoload
(defun pyim-cangjie5dict-enable ()
  "Add cangjie5 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjiedict.el")))
         (file (concat dir "pyim-cangjie5dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie5-elpa" :file ,file :elpa t))
        (message "pyim 没有安装，pyim-cangjie5dict 启用失败。")))))

;;;###autoload
(defun pyim-cangjie6dict-enable ()
  "Add cangjie6 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjiedict.el")))
         (file (concat dir "pyim-cangjie6dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie6-elpa" :file ,file :elpa t))
        (message "pyim 没有安装，pyim-cangjie6dict 启用失败。")))))

;; * Footer

(provide 'pyim-cangjiedict)

;;; pyim-cangjiedict.el ends here
