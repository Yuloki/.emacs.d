;;
;;
;; Emacs configuration by Alexandre Strzelewicz
;;
;;


;; COLOR PARENTHESIS
(load-library "paren")
(show-paren-mode 1)

;; DISABLE BACKUP FILES
(setq make-backup-files nil)
(setq delete-auto-save-files t)

(custom-set-faces
 '(cursor ((t (:background "chartreuse"))))
 '(highlight ((t (:background "black" :height 1.0 :weight bold))))
 '(mouse ((t (:background "white"))))
 '(font-lock-string-face ((t (:foreground "green"))))
 '(font-lock-keyword-face ((t (:foreground "cyan" :weight bold))))
 '(font-lock-preprocessor-face ((t (:foreground "blue" :weight bold))))
 '(font-lock-type-face ((t (:foreground "green"))))
 '(font-lock-variable-name-face ((default (:foreground "red"))))
)


(global-font-lock-mode t)
(setq-default indicate-empty-lines t)
(transient-mark-mode t)
(column-number-mode t)

;; COLORS
(set-cursor-color "Red")
(set-face-background 'region "Red")
(set-face-background 'show-paren-match-face "Blue")
(set-face-background 'show-paren-mismatch-face "Magenta")
(set-face-foreground 'show-paren-mismatch-face "Red")
(set-face-foreground 'highlight "yellow")

;; MISC
(setq inhibit-startup-message t)
(setq frame-title-format "%S: %f")
(modify-frame-parameters nil '((wait-for-wm . nil)))
(fset 'yes-or-no-p 'y-or-n-p)
(icomplete-mode 1)
(setq column-number-mode t)
(setq display-time-string-forms '((format "[%s:%s]-[%s/%s/%s] " 24-hours minutes day month year)))

;; TEXT MODE
;;(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; FONTS
(set-default-font "9x15")

;; ;; SHORTCUTS
;;(global-set-key "\C-t" 'shell-toggle-cd)
;;(global-set-key "\C-i" 'indent-region)
(global-set-key (kbd "C-c g") 'goto-line)
(global-set-key (kbd "C-c c") 'comment-region)
(global-set-key (kbd "C-c v") 'uncomment-region)
;; (global-set-key [f4] 'speedbar)

(setq scroll-preserve-screen-position t)
(add-hook 'save-buffer-hook 'delete-trailing-whitespace)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  Graphic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(if window-system
    (progn
      (set-background-color "Black")
      (set-foreground-color "Black")
      (set-cursor-color "Red")
      ;(set-default-font "9x15")
      (setq visible-bell t)
      ;; Suppression du menu
      (menu-bar-mode nil)
      (tool-bar-mode nil)
      (global-linum-mode 1)
      ;; remove toolbar
      (tool-bar-mode -1)
      ;; remove scrollbar
      (scroll-bar-mode -1)
      ;; font reduite
      (set-face-font 'default "-*-fixed-medium-r-*-*-13-*-*-*-*-*-iso8859-15")
      (set-face-font 'menu "-*-fixed-medium-r-*-*-10-*-*-*-*-*-iso8859-15")
      (setq default-frame-alist '(
                                  (width . 177)
                                  (height . 75)
                                  (top . 00)
                                  (left . 00)
				    (cursor-type . box)
				      (cursor-in-non-selected-windows nil)
				        ))
      (set-face-italic-p 'font-lock-comment-face t)
      ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  Plugins
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/plugins")

;;(require 'highlight-current-line)
;;(highlight-current-line-on t)
;;(set-face-background 'highlight-current-line-face "light yellow")
;;(global-hl-line-mode 1)
 
;; To customize the background color
;;(set-face-background 'hl-line "blue")  ;; Emacs 22 Only

;; saving last cursor position
(when (require 'saveplace)
  (setq-default save-place t))

;; speed file switching
(require 'ido)
  (ido-mode t)


;; transform file to htmlified !
(require 'htmlize)

;;go to last edit point
;(require 'goto-last-change)
;(global-set-key "\C-u" 'goto-last-change)

;;(require 'yasnippet-bundle)
(add-to-list 'load-path
                  "~/.emacs.d/plugins/yas061")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yas061/snippets")


(autoload 'shell-toggle-cd "~/.emacs.d/shell-toggle.el"
  "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
;;(speedbar 1)

;; fly betwenn windo (M-<right> M-<left> & co)
(windmove-default-keybindings 'meta)

(global-set-key (kbd "<f5>") 'shrink-window-horizontally)
(global-set-key (kbd "<f6>") 'enlarge-window-horizontally)
(global-set-key (kbd "<f7>") 'shrink-window)
(global-set-key (kbd "<f8>") 'enlarge-window)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  PYTHON MOD
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
    (setq interpreter-mode-alist (cons '("python" . python-mode)
                                       interpreter-mode-alist))
    (autoload 'python-mode "python-mode" "Python editing mode." )

;;; Electric Pairs
;;  (add-hook 'python-mode-hook
;;      (lambda ()
;;       (define-key python-mode-map "\"" 'electric-pair)
;;       (define-key python-mode-map "\'" 'electric-pair)
;;       (define-key python-mode-map "(" 'electric-pair)
;;       (define-key python-mode-map "[" 'electric-pair)
;;       (define-key python-mode-map "{" 'electric-pair)))
;; (defun electric-pair ()
;;   "Insert character pair without sournding spaces"
;;   (interactive)
;;   (let (parens-require-spaces)
;;     (insert-pair)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                  MORE
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; AUTOCOMPLETE
;;(add-to-list 'load-path "~/.emacs.d/")
;;(require 'auto-complete-config)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;;(ac-config-default)


;;(require 'python)
;;(require 'auto-complete)
;;(require 'yasnippet)

;; AUTO tab
(add-hook 'c-mode-common-hook '(lambda ()
				 (local-set-key (kbd "RET") 'newline-and-indent)))

;; Save layout
(autoload 'save-current-configuration "revive" "Save status" t)
(autoload 'resume "revive" "Resume Emacs" t)
(autoload 'wipe "revive" "Wipe Emacs" t)

;;(define-key ctl-x-map "S" 'save-current-configuration)
;;(define-key ctl-x-map "F" 'resume)
;;(define-key ctl-x-map "K" 'wipe)

;;(require 'windows)
;;   (win:startup-with-window)
;;(define-key ctl-x-map "C" 'see-you-again)
;;(load "~/.emacs.d/nxhtml/autostart.el")
;;(setq mumamo-background-colors nil) 
;;(add-to-list 'auto-mode-alist '("\\.html$" . nxhtml-mode))

;;(autoload 'js2-mode "js2" nil t)
;;(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;(shell-toggle-cd)
;;(delete-other-windows)

(add-to-list 'load-path "~/.emacs.d/")
(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))
