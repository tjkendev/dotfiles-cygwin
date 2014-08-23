; function for adding load-path
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
	(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
	    (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elisp")

; Custom Settings
;; �c�[���o�[��\��
(tool-bar-mode -1)
;; �s�ԍ��\��
(global-linum-mode t)
(set-face-attribute 'linum nil
		    :foreground "#888"
		    :height 0.9)
;; �s�ԍ��t�H�[�}�b�g
(setq linum-format "%4d")
;; �^�u���X�y�[�X��
(setq-default indent-tabs-mode nil)
;; �^�u��
(custom-set-variables '(tab-width 2))
;; y or n
(fset 'yes-or-no-p 'y-or-n-p)
;; �o�b�N�A�b�v�Ȃ�
(setq make-backup-files nil)
;; ���[�h���C���ɍs�ԍ��\��
(line-number-mode t)
;; ���[�h���C���ɗ�ԍ��\��
(column-number-mode t)
;; �N���b�v�{�[�h�𗘗p����
(setq x-select-enable-clipboard t)

; set theme
(load-theme 'misterioso t)

; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(auto-install-from-url "https://raw.github.com/m2ym/popwin-el/v0.3/popwin.el")
(auto-install-from-url "https://raw.github.com/syohex/emacs-quickrun/master/quickrun.el")

; auto-complete
(add-to-list 'load-path "~/.emacs.d/elisp")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/ac-dict")
(ac-config-default)

; quickrun
(require 'quickrun)
;(push '("*quickrun*") popwin:special-display-config)
(global-set-key (kbd "<f5>") 'quickrun)

; Gauche (\C-cS)
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq gosh-program-name "/usr/local/bin/gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme gosh-program-name))
(define-key global-map
  "\C-cS" 'scheme-other-window)
