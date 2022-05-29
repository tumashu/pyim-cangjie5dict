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
;; ** 簡介(Introduction)
;; pyim-cangjiedict 是 pyim 的一個倉頡輸入法詞庫。
;;
;; pyim-cangjiedict is a dict of Cangjie input scheme for [pyim](https://github.com/tumashu/pyim).
;;
;; 第一版詞庫僅支持倉頡五代，故名稱爲=pyim-cangjie5dict=，後續加入了六代詞庫，更名爲=pyim-cangjiedict=。現已加入對三代的支持。
;;
;; The first version of the project only supported the Cangjie v5, so the name is =pyim-cangjie5dict=, and version 6th was subsequently added and renamed =pyim-cangjiedict=.
;;
;; 其中三代詞庫修改自 [[https://github.com/Arthurmcarthur/Cangjie3-Plus][Cangjie3-Plus]] 項目。
;;
;; 五代詞庫修改自 [[https://github.com/rime/rime-cangjie][rime-cangjie]] 項目，源於《五倉世紀》。
;;
;; 六代（蒼頡檢字法）詞庫修改自 [[https://github.com/rime-aca/rime-cangjie6][rime-cangjie6]] 項目。
;;
;; The cangjie3dict originated from the [[https://github.com/Arthurmcarthur/Cangjie3-Plus][Cangjie3-Plus]] project,
;; the cangjie5dict originated from the [[https://github.com/rime/rime-cangjie][rime-cangjie]] project.
;; And the cangjie6dict is modified from the [[https://github.com/rime-aca/rime-cangjie6][rime-cangjie6]] project.
;;
;; ** 安裝和使用(Installation)
;; 1. 配置melpa源，參考：http://melpa.org/#/getting-started
;; 2. M-x package-install RET pyim-cangjiedict RET
;; 3. 在emacs配置文件中（比如: ~/.emacs）添加如下代碼：
;;    #+BEGIN_EXAMPLE
;;    (require 'pyim-cangjiedict)
;;    (setq pyim-default-scheme 'cangjie)
;;    ;; 以下命令可任選其一：
;;    ;; (pyim-cangjie3dict-enable) ;; 啓用三代詞庫(Enable cangjie3)
;;    ;; (pyim-cangjie5dict-enable) ;; 啓用五代詞庫(Enable cangjie5)
;;    ;; (pyim-cangjie6dict-enable) ;; 啓用六代詞庫(Enable cangjie6)
;;    #+END_EXAMPLE
;;
;;; Code:
;; * 代碼                                                               :code:
(require 'pyim-dict)
(require 'pyim-scheme)

(pyim-scheme-add
 '(cangjie
   :document "倉頡輸入法。"
   :class xingma
   :first-chars "abcdefghijklmnopqrstuvwxyz"
   :rest-chars "abcdefghijklmnopqrstuvwxyz"
   :code-prefix "cangjie/" ;倉頡輸入法詞庫中所有的 code 都以 "cangjie/" 開頭，防止詞庫衝突。
   :code-prefix-history ("@") ;倉頡輸入法詞庫曾經使用過的 code-prefix
   :code-split-length 5 ;默認將用戶輸入切成 5 個字符長的 code 列表（不計算 code-prefix）
   :code-maximum-length 5 ;倉頡詞庫中，code 的最大長度（不計算 code-prefix）
   :prefer-triggers nil))

;;;###autoload
(defun pyim-cangjie3dict-enable ()
  "Add cangjie3 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjiedict.el")))
         (file (concat dir "pyim-cangjie3dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim-dict)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie3-elpa" :file ,file :elpa t))
        (message "pyim 沒有安裝，pyim-cangjie3dict 啓用失敗。")))))

;;;###autoload
(defun pyim-cangjie5dict-enable ()
  "Add cangjie5 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjiedict.el")))
         (file (concat dir "pyim-cangjie5dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim-dict)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie5-elpa" :file ,file :elpa t))
        (message "pyim 沒有安裝，pyim-cangjie5dict 啓用失敗。")))))

;;;###autoload
(defun pyim-cangjie6dict-enable ()
  "Add cangjie6 dict to pyim."
  (interactive)
  (let* ((dir (file-name-directory
               (locate-library "pyim-cangjiedict.el")))
         (file (concat dir "pyim-cangjie6dict.pyim")))
    (when (file-exists-p file)
      (if (featurep 'pyim-dict)
          (pyim-extra-dicts-add-dict
           `(:name "cangjie6-elpa" :file ,file :elpa t))
        (message "pyim 沒有安裝，pyim-cangjie6dict 啓用失敗。")))))

;; * Footer

(provide 'pyim-cangjiedict)

;;; pyim-cangjiedict.el ends here
