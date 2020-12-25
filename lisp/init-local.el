(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                           ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(custom-set-variables
 '(markdown-command "C:/Users/Administrator/AppData/Local/Pandoc/pandoc.exe"))
;;;; 设置编辑环境
;; 设置为中文简体语言环境
(set-language-environment 'Chinese-GB)
;; 设置emacs 使用 utf-8
(setq locale-coding-system 'utf-8)
;; 设置键盘输入时的字符编码
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
;; 文件默认保存为 utf-8
(set-buffer-file-coding-system 'utf-8)
(set-default buffer-file-coding-system 'utf8)
(set-default-coding-systems 'utf-8)
;; 解决粘贴中文出现乱码的问题
(set-clipboard-coding-system 'utf-8)
;; 终端中文乱码
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
;; 解决文件目录的中文名乱码
(setq-default pathname-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
;; 解决 Shell Mode(cmd) 下中文乱码问题
(defun change-shell-mode-coding ()

  (progn
    (set-terminal-coding-system 'gbk)
    (set-keyboard-coding-system 'gbk)
    (set-selection-coding-system 'gbk)
    (set-buffer-file-coding-system 'gbk)
    (set-file-name-coding-system 'gbk)
    (modify-coding-system-alist 'process "*" 'gbk)
    (set-buffer-process-coding-system 'gbk 'gbk)
    (set-file-name-coding-system 'gbk)))
;; 编码设置 end
;;;开启动态语言shell
(defun python-shell()
  "make a python shell"
  (interactive)
  (switch-to-buffer (make-comint "python" "python" nil "-i")))
(defun groovy-shell()
  "make a groovy shell"
  (interactive)
  (switch-to-buffer (make-comint "groovy" "groovysh" nil)))
(defun perl-shell()
  "make a perl db shell"
  (interactive)
  (switch-to-buffer (make-comint "perl" "perl" nil "-d -e''")))
(require 'ruby-mode)
(require 'inf-ruby)
;;;mate+o执行正在编辑的perl脚本
(defun runperl()
  "run perl,执行当前缓冲区的Perl程序"
  (interactive)
  ;(save-buffer)
  (let ((filename buffer-file-name)
 (cmd "")
 (oldbuf (current-buffer))
 (end (point-max)))
    (if filename
 (save-buffer)
      (save-excursion
 (setq filename (concat (getenv "tmp") "/temp.pl"))
 (set-buffer (create-file-buffer filename))
 (insert-buffer-substring oldbuf 1 end)
 (write-file filename)
 (kill-buffer (current-buffer))))
    (setq cmd (concat "perl -w " filename))
    (message "%s  ..." cmd)
    (shell-command cmd)))
(global-set-key[(meta o)] 'runperl) ;bind-key alt+o:runperl

(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))
(with-eval-after-load 'eshell (set-language-environment "chinese-GB"))
(with-eval-after-load 'powershell (set-language-environment "chinese-GB"))
(setq inhibit-compacting-font-caches t)
(provide 'init-local)
