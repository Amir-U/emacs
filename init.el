;Amir - i commented the following line after i got a warning saying that the path should not contain the emacs.d directory.
; uncommented it because emacs does not go into mail mode.
;Amir added lisp to the path after getting error messages.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(setq load-path (cons "~/.emacs.d/lisp" load-path))


(setq load-path (cons "~/.emacs.d/site-lisp" load-path))

;Added by Amir for mutt.
;On second thought, i will start the server manually.

;(server-start)
;(add-to-list 'auto-mode-alist '("/mutt" . mail-mode))


;------------------------------------------------------------
; Load some libraries
;------------------------------------------------------------

;I think i do not need this mode now when i am using the client.
;(load-library "muttrc-mode")

;I commented it because i am using ibus to input Hebrew. (Amir)
;(setq default-input-method "hebrew-custom-lyx")

(setq-default bidi-display-reordering t)

;; (load-library "hebrew-en-dvorak")			; Hebrew input methods
;; (setq default-input-method "hebrew-lyx-en-dvorak")

;------------------------------------------------------------
; Load my libraries
;------------------------------------------------------------
;; (load-library "my-utils")    ; general utilities

;Amir: do i have such a library? At the moment i commented it.
;(load-library "my-keys")     ; key bindings & functions
;; (load-library "my-calendar") ; calendar customizations
(load-library "my-modes")    ; customizations to modes & hooks
;; (load-library "my-rst")	     ; reStructures text customizations
;; (load-library "my-dict")     ; dictionary customizations
;; (load-library "my-abbreviations")
;; (load-library "my-server")
;; (load-library "my-org")	     ; org-mode settings

;------------------------------------------------------------
; UI & Fonts
;------------------------------------------------------------
(blink-cursor-mode -1)			; -1 non-blinking, 1 blinks
(setq x-stretch-cursor t)

; Also set in .Xresources - here for terminals.
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;I actually want the menu, so i changed it.
(if (fboundp 'menu-bar-mode) (menu-bar-mode 1))

(global-font-lock-mode t)
(setq transient-mark-mode t)
(show-paren-mode t)

(set-face-foreground 'highlight "white")
(set-face-background 'highlight "blue")

;------------------------------------------------------------
; Misc settings
;------------------------------------------------------------

(if (>= emacs-major-version 22)
; I cancelled the next line to get rid of these messages that kept coming about the desktop...
    (desktop-save-mode 0))		; save emacs session

;; (set-keyboard-coding-system 'utf-8)	; required, for some reason, for old emacs

(setq vc-follow-symlinks t)		; automatically follow symbolic links to files
					; under version-control

(recentf-mode 1)			; remember recent files

; set unicode data file location. (used by what-cursor-position)
(let ((x "~/.emacs.d/UnicodeData.txt"))
  (when (file-exists-p x)
    (setq describe-char-unicodedata-file x)))

(setq-default ispell-program-name "aspell")

;; (setq compile-command "r2w ~/new-docs/site.ini -w")

; enable pasting from the X clipboard
(setq x-select-enable-clipboard t)
;;(setq scroll-step 4)
(setq colon-double-space t)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; (setq Info-default-directory-list
;;       (append '("/usr/local/info/"
;; 		"/usr/local/share/info/"
;; 		"/usr/local/gnu/info/"
;; 		"/usr/local/gnu/lib/info/"
;; 		"/usr/local/gnu/lib/emacs/info/"
;; 		"/usr/local/emacs/info/"
;; 		"/usr/local/lib/info/"
;; 		"/usr/local/lib/emacs/info/"
;; 		"/usr/share/info/"
;; 		"/usr/local/texlive/2008/texmf/doc/info")
;; 	      Info-default-directory-list))


;; To add info files, add them to the `dir` file in the
;; /usr/local/info directory.
;; Note: after all, it seems it was enough to create a
;; proper /usr/local/info/dir file. Info probably looks
;; for it by default.

;; (setq Info-default-directory-list
;;       (append '("/usr/local/info/")
;; 	      Info-default-directory-list))


;; This seems not to work:

;; (require 'info)
;; (setq Info-directory-list
;;       (cons (expand-file-name "/usr/local/info")
;;             Info-directory-list))



; return a backup file path of a give file path
; with full directory mirroring from a root dir
; non-existant dir will be created
;; (defun my-backup-file-name (fpath)
;;   "Return a new file path of a given file path.
;; If the new path's directories does not exist, create them."
;;   (let (backup-root bpath)
;;     (setq backup-root "~/var/backup/emacs/files-backup")
;;     (setq bpath (concat backup-root fpath "~"))
;;     (make-directory (file-name-directory bpath) bpath)
;;     bpath
;;   )
;; )

;; (setq make-backup-file-name-function 'my-backup-file-name)
;; (setq auto-save-list-file-prefix "~/var/backup/emacs/auto-save-list/.saves-")
;; (setq woman-use-own-frame nil)
;; settings for new frames, e.g. those open by emacsclient

;Commented by Amir. Trying to solve the Japanese issue. Fonts do not come out right on the receiving side.
;it did not solve it. Changed from 10 to 11.
(add-to-list 'default-frame-alist '(font . "Lucida Sans Typewriter-11"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(default-input-method "japanese")
 '(package-selected-packages (quote (rust-mode sokoban)))
 '(safe-local-variable-values (quote ((encoding . utf-8))))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey15" :foreground "LemonChiffon1" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 181 :width normal :foundry "b&h" :family "Lucida Sans Typewriter")))))


;Added to solve issue with Hebrew. I would like to use the built in input method for writing Hebrew.
(load-library "quail-custom-keyboard-layouts")
; Custom layouts not installed with Emacs
(quail-set-keyboard-layout "us-dvorak")
; Set current keyboard layout



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;added for Japanese
;(require 'ibus)
;(add-hook 'after-init-hook 'ibus-mode-on)


;I think this is not necessary because i have the init.el file
;(load-file "/usr/share/emacs/site-lisp/emacs-mozc/mozc.el")

;Following the new instalation by Amit this was canelled since at the moment i am not using mozc. Maybe later i;f i wll decide to have Japanese input.

;(require 'mozc)
;(set-language-environment "Japanese")
;(setq default-input-method "japanese-mozc")

;Auto-comlete (added in April 2016)

;Same as above, was cancelled.
;(require 'auto-complete)
;   (add-to-list 'ac-dictionary-directories "/usr/share/auto-complete/dict/")
;   (require 'auto-complete-config)
;   (ac-config-default)
