;;; pyim-cangjie5dict.el --- Some cangjie5 dicts for pyim

;; * Header
;; Copyright (C) 2017 Yuanchen Xie <yuanchen.gm@gmail.com>

;; Author: Yuanchen Xie <yuanchen.gm@gmail.com>
;; URL: https://github.com/erstern/pyim-cangjie5dict
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
;; * pyim-cangjie5dict README                         :README:doc:

;; ** 简介
;; pyim-cangjie5dict 是 pyim 的一个倉頡五代词库，修改自 RIME 项目。源于《五倉世紀》。

;; ** 安装和使用
;; 1. 配置melpa源，参考：http://melpa.org/#/getting-started
;; 2. M-x package-install RET pyim-cangjie5dict RET
;; 3. 在emacs配置文件中（比如: ~/.emacs）添加如下代码：
;;    #+BEGIN_EXAMPLE
;;    (require 'pyim-cangjie5dict)
;;    (pyim-cangjie5dict-enable)
;;    (setq pyim-default-scheme 'cangjie)
;;    #+END_EXAMPLE

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
   :code-split-length 5 ;默认将用户输入切成 5 个字符长的 code 列表（不计算 code-prefix）
   :code-maximum-length 5 ;仓颉词库中，code 的最大长度（不计算 code-prefix）
   :prefer-triggers nil))

;;;###autoload
(defun pyim-cangjie5dict-enable ()
  "Add cangjie5 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjie5dict.el")))
         (file (concat dir "pyim-cangjie5dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie5-elpa" :file ,file :elpa t))
        (message "pyim 没有安装，pyim-cangjie5dict 启用失败。")))))

;; * Footer

(provide 'pyim-cangjie5dict)

;;; pyim-cangjie5dict.el ends here
