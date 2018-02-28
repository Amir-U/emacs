
;; Some exmaples for notation
;; ---------------------------
;; \C : Control
;; \C-x : Control+x
;; \C-x\C-m : Control+x, then Control+m
;; [C-f8] : Control+F8
;; [kp-add] : plus key on the numeric keypad
;; [M-down] : Meta key and down arrow.
;; [mouse-5] : mouse wheel, up
;; [mouse-4] : mouse wheel, down (or the other way around...)

;; Meta key can usualy be activated by either the Escap key or the Alt key.
;; If using Escap, you press and release the Escape, thenrpess the other key.
;; If using the the Alt, you press it together with the other key.

(global-set-key "\C-x\C-m"   'execute-extended-command)
(global-set-key "\C-c\C-m"   'execute-extended-command)
;; (global-set-key "\C-w"       'backward-kill-word) ; default bind: kill-region
;; (global-set-key "\C-x\C-k"   'kill-region) ; default bind: edit-kbd-macro
(global-set-key "\C-xt"      'beginning-of-buffer)
;; (global-set-key "\C-xe"      'end-of-buffer) ; default bind: call-last-kbd-macro
;; (global-set-key "\C-x\C-b"   'buffer-menu) ; default bind: buffer-list
(global-set-key "\C-cg"      'goto-line)
(global-set-key "\C-cr"      'replace-string)

(global-set-key [C-f8]            'first-error)
(global-set-key [f8]              'next-error)
(global-set-key [S-f8]            'previous-error)
(global-set-key [f5]              'ispell-word)
(global-set-key [f6]              'scroll-right)
(global-set-key [f7]              'scroll-left)
(global-set-key [f9]              'compile)
(global-set-key [f10]             'start-kbd-macro)
(global-set-key [f11]             'end-kbd-macro)
(global-set-key [f12]             'call-last-kbd-macro)
(global-set-key [kp-add]          'enlarge-window)
(global-set-key [kp-subtract]     'shrink-window)
(global-set-key [kp-decimal]      'what-cursor-position)

(define-key global-map "\C-cf" 'recentf-open-files)

(global-set-key [M-down] '(lambda()
			    "scroll down, cursor remains in place"
			    (interactive)
			    (scroll-up 1)
			    (next-line 1)))

(global-set-key [M-up] '(lambda()
			  "scroll up, cursor remains in place"
			  (interactive)
			  (scroll-up -1)
			  (next-line -1)))

(global-set-key [mouse-5] '(lambda()
			     "scroll down one line"
			     (interactive)
			     (scroll-down -1)))

(global-set-key [mouse-4] '(lambda()
			     "scroll up one line"
			     (interactive)
			     (scroll-down 1)))



