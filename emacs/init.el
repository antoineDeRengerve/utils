;; Fichier .emacs exemple d'Emmanuel Plaut, téléchargeable sur
;; http://www.ensem.inpl-nancy.fr/~eplaut/configXEmacs.html

(setq inhibit-startup-message t)    ;; Hide the startup message

;;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

;;; Required packages
;;; everytime emacs starts, it will automatically check if those packages are
;;; missing, it will install them automatically
(when (not package-archive-contents)
  (package-refresh-contents))
(defvar tmtxt/packages
  '(ispell js2-mode ac-js2 multi-web-mode web-mode smart-tabs-mode cedet arduino-mode zenburn-theme ecb tern tern-auto-complete js2-refactor imenu helm markdown-mode markdown-preview-mode evil linum-relative magit neotree fasd flycheck json-mode flycheck-color-mode-line flycheck-pos-tip feature-mode elpy pyenv-mode blacken prettier-js))
(dolist (p tmtxt/packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; Pour afficher le numéro de la ligne courante :
(line-number-mode 1)

;; Remove scroll/menu/tool bar
(scroll-bar-mode -1)
(tool-bar-mode -1)
;(menu-bar-mode -1)


;; Pour avoir une touche Delete qui efface bien en arrière :

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-key-deletes-forward t)
 '(ecb-options-version "2.40")
 '(gnuserv-program (concat exec-directory "/gnuserv"))
 '(inhibit-startup-screen t)
 '(js-chain-indent t)
 '(js2-bounce-indent-p t)
 '(load-home-init-file t t)
 '(package-selected-packages
   (quote
	(js2-mode zenburn-theme zenburn web-mode tern-auto-complete smart-tabs-mode neotree multi-web-mode markdown-preview-mode magit linum-relative js2-refactor help-fns+ helm evil ecb arduino-mode ac-js2)))
 '(pc-select-meta-moves-sexps t)
 '(pc-select-selection-keys-only t)
 '(pc-selection-mode t)
 '(query-user-mail-address nil)
 '(show-paren-mode t)
 '(user-mail-address "antoine.derengerve@partnering.fr"))


;; Pour avoir de belles couleurs à l'écran :
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq-default font-lock-use-fonts '(or (mono) (grayscale)))
(setq-default font-lock-use-colors '(color))
(setq-default font-lock-maximum-decoration nil)
(setq-default font-lock-maximum-size 256000)
(setq-default font-lock-mode-enable-list nil)
(setq-default font-lock-mode-disable-list nil)
(require 'font-lock)
(remove-hook 'font-lock-mode-hook 'turn-on-fast-lock)
(remove-hook 'font-lock-mode-hook 'turn-on-lazy-shot)

;;(set-face-background 'default "white")
(set-face-foreground 'font-lock-keyword-face "blue")
(set-face-foreground 'font-lock-function-name-face "red")

;; set background color in term to usual
;; NOT OK : only background of text not whole window...
; (setq term-default-bg-color "#211E1E")
; (setq term-default-fg-color "#AAAAAA")

;; Pour pouvoir taper des caractères accentués avec les touches de fonction :

(global-set-key [(shift f1)] [(É)])
(global-set-key [f1] [(é)])

(global-set-key [(shift f2)] [(È)])
(global-set-key [f2] [(è)])

(global-set-key [(shift f3)] [(Ê)])
(global-set-key [f3] [(ê)])

(global-set-key [f4] [(ë)])

(global-set-key [(shift f5)] [(À)])
(global-set-key [f5] [(à)])

(global-set-key [(shift f6)] [(Â)])
(global-set-key [f6] [(â)])

(global-set-key [f7] [(î)])
(global-set-key [f8] [(ï)])
(global-set-key [f9] [(ù)])
(global-set-key [f10] [(û)])
(global-set-key [f11] [(ô)])
(global-set-key [f12] [(ç)])

;;; Pour pouvoir taper les accents français avec les touches de fonction :

(global-set-key [(shift f11)] [(«)])
(global-set-key [(shift f12)] [(»)])

(setq minibuffer-max-depth nil)

;;; func-menu is a package that scans your source file for function definitions
;;; and makes a menubar entry that lets you jump to any particular function
;;; definition by selecting it from the menu.  The following code turns this on
;;; for all of the recognized languages.  Scanning the buffer takes some time,
;;; but not much.
;;;
(cond ((string-match "Emacs\\|Trusty" emacs-version)
       (require 'func-menu)
       (define-key global-map 'f8 'function-menu)
       (add-hook 'find-file-hooks 'fume-add-menubar-entry)
       (define-key global-map "\C-cg" 'fume-prompt-function-goto)
       (define-key global-map '(shift button3) 'mouse-function-menu)
       ))


;; Repondre 'y' plutot que 'yes'.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Langue par defaut et caracteres accentues
(setq current-language-environment "French")

;; Pour que le curseur ne clignote plus
(blink-cursor-mode 0)

;; Reconnaissance syntaxique
;(global-font-lock-mode t)

;; Favoris pour la selection de region
;(pc-selection-mode t)
(pending-delete-mode t)
(setq transient-mark-mode t)

;; On fixe la longueur d'une tabulation
;(setq tab-width 4) ; or any other preferred value
;(defvaralias 'c-basic-offset 'tab-width)
;(defvaralias 'cperl-indent-level 'tab-width)
;(setq c-basic-offset 1)

;;; Using smart tabs
(setq-default tab-width 4) ; or any other preferred value
(setq-default indent-tabs-mode t)
;;(smart-tabs-insinuate 'c 'c++ 'java 'cperl 'ruby 'nxml)
(smart-tabs-insinuate 'c 'c++ 'javascript 'java 'cperl 'ruby 'nxml)


;; Python specific tab management
(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
	(setq whitespace-style '(face lines-tail trailing)) ; show tabs (use spaces instead)
        (setq python-indent_offset 4)))
        (setq flycheck-python-pylint-executable "/usr/bin/pylint")

;; arduino-mode config
;(add-to-list 'auto-mode-alist '("\\.\\(pde\\|ino\\)$" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.ino\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.pde\\'" . c++-mode))
;(add-to-list 'auto-mode-alist '("\\.\\(pde\\|ino\\)$" . arduino-mode))
;(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)

;; Auto config for c++ mode
(add-to-list 'auto-mode-alist '("\\.cpp\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; Auto config for javascript
(add-to-list 'auto-mode-alist '("\\.json$" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; Afficher la 'parenthese correspondante'
(require 'paren)
(show-paren-mode t)

;; Recherche non case-sensitive
(setq case-fold-search t)

(setq line-number-mode t)

;;(which-function-mode t)

(global-set-key [(meta backspace)] 'backward-kill-word)

;; insert tabulation with Ctrl-TAB
(global-set-key (kbd "C-<tab>") (lambda () (interactive) (insert "	" )))


;; -----------------------------------------------------
;; CORRECTEUR ISPELL
;; -----------------------------------------------------

;: Dictionnaire francais
(setq-default ispell-program-name "aspell")

;; Empeche Ispell de verifier le contenu de certaines commandes
(setq ispell-tex-skip-alists
      (list
       (append (car ispell-tex-skip-alists)
               '(("\\\\cite"            ispell-tex-arg-end)
                 ("\\\\nocite"          ispell-tex-arg-end)
                 ("\\\\includegraphics" ispell-tex-arg-end)
                 ("\\\\figScale"         ispell-tex-arg-end)
                 ("\\\\author"          ispell-tex-arg-end)
                 ("\\\\ref"             ispell-tex-arg-end)
                 ("\\\\eqref"             ispell-tex-arg-end)
                 ("\\\\label"           ispell-tex-arg-end)
                 ))
       (cadr ispell-tex-skip-alists)))

;; Empeche Ispell de verifier le contenu des citation natbib
(eval-after-load "ispell"
  '(let ((list (car ispell-tex-skip-alists)))
     (add-to-list 'list '("\\\\cite[tp]" ispell-tex-arg-end))
     (setcar ispell-tex-skip-alists list)))


;; -----------------------------------------------------
;; COMMANDES AucTeX / LaTeX
;; -----------------------------------------------------

;; Choix des programmes de visualition selon le fichier de sortie
(setq TeX-output-view-style (quote (("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start %f") ("^dvi$" "." "xdvi %dS %d") ("^pdf$" "." "xpdf %o") ("^html?$" "." "start %o"))))
(setq TeX-view-style (quote (("^epsf$" "start %f") ("." "xdvi %dS %d"))))

;; Pour voir les les equations compilees directes dans  emacs
;(load "preview-latex.el" nil t t)

;; Quelques commandes additionnelles du mode LaTeX
(add-hook 'LaTeX-mode-hook
  (function
    (lambda ()
      (add-to-list 'TeX-command-list
             (list "PDFLaTeX" "pdflatex %s.tex"
                   'TeX-run-command nil t))
      (add-to-list 'TeX-command-list
             (list "Acroread" "acroread %s.pdf"
                  'TeX-run-command nil t))
      (add-to-list 'TeX-command-list
             (list "XPDF" "xpdf %s.pdf"
                   'TeX-run-command nil t))
      (add-to-list 'TeX-command-list
             (list "DVIPS" "dvips -o %s.ps %s.dvi"
                   'TeX-run-command nil t))
      (add-to-list 'TeX-command-list
             (list "Clean" "rm %s.log %s.aux %s.out %s.idx"
                   'TeX-run-command nil t))
      (add-to-list 'TeX-command-list
             (list "KghostView" "kghostview %s.pdf"
                   'TeX-run-command nil t))
      (TeX-PDF-mode)
      ;gestion de la table matiÃ¨re et autre...
      (reftex-mode)
      ;; Corrrection Ã  la volÃ©e syntaxique
      (flyspell-mode)
      ;; dictionnaire Ã©vitant les erreurs d'accents
      (ispell-change-dictionary "francais")
      ;; Correction automatique de la taille des lignes
      (auto-fill-mode 1)
)))

;; Aller a la prochaine erreur LaTeX
(global-set-key [f11]      'TeX-next-error) ; goto next found
                        ; LaTeX error
(global-set-key [f12]      'next-error)     ; goto next found lacheck
                        ; error (run Check first)


;(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
; '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 92 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
; '(font-lock-comment-face ((((class color) (min-colors 88) (background light)) (:background "White" :foreground "#019D0C"))))
; '(font-lock-keyword-face ((((class color) (min-colors 88) (background light)) (:background "White" :foreground "Blue"))))
; '(font-lock-string-face ((((class color) (min-colors 88) (background light)) (:background "White" :foreground "Red")))))

;;(load 'func-menu)
;;(define-key global-map 'f8 'function-menu)
;;(add-hook 'find-file-hooks 'fume-add-menubar-entry)
;;(define-key global-map "\C-cl" 'fume-list-functions)
;;(define-key global-map "\C-cg" 'fume-prompt-function-goto)

;;(define-key global-map '(shift button3) 'mouse-function-menu)

;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
 (concat "~/.emacs-backups/"))

(make-directory autosave-dir t)


(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
	  (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "~/.emacs-backups/"))
(setq backup-directory-alist (list (cons "." backup-dir)))


;; UTF-8 configuration
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Title bar customization
(setq frame-title-format "%b - emacs")


;; Define mode to manage javascript
;(require 'auto-complete)
;(require 'ac-js2)
;(global-auto-complete-mode t)

(require 'js2-refactor)
(add-hook 'js2-mode-hook 'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-q")
;; eg. extract function with `C-c C-m ef`.
(add-hook 'js-mode-hook 'js2-minor-mode)
;; js2-mode provides 4 level of syntax highlighting. They are * 0 or a
;; negative value means none. * 1 adds basic syntax highlighting. * 2
;; adds highlighting of some Ecma built-in properties. * 3 adds
;; highlighting of many Ecma built-in functions.
(setq js2-highlight-level 3)
(add-to-list 'load-path "~/.emacs.d/tern/emacs/")
(autoload 'tern-mode "tern.el" nil t)
(add-hook 'js2-mode-hook (lambda () (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq js2-strict-missing-semi-warning nil)
(setq js2-strict-trailing-comma-warning nil)
;; Prevent indentation for multi line expressions
;;(setq js-indent-level 1)


;; Configure imenu NOT WORKING
(defun try-to-add-imenu ()
  (condition-case nil (imenu-add-to-menubar "IMenu") (error nil)))
(add-hook 'font-lock-mode-hook 'try-to-add-imenu)
(defvar imenu-sort-function imenu--sort-by-name)
(defun my-imenu-rescan ()
  (interactive)
  (imenu--menubar-select imenu--rescan-item))
(global-set-key (kbd "C-c i") 'my-imenu-rescan)


;; Helm config
(require 'helm-config)
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(helm-mode 1)

;; save sessions in directory
(if (daemonp)
    (setq desktop-dirname "~/.emacs.d/desktop/"
		  desktop-save                t
		  desktop-load-locked-desktop t)
    (setq desktop-dirname "."))
(setq desktop-base-file-name ".emacs-desktop"
	  desktop-path (list desktop-dirname)
	  desktop-restore-frames t
	  desktop-restore-in-current-display t)
;(setq desktop-restore-forces-onscreen nil)
(desktop-save-mode 1)


;; Web development
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 4))
  (setq web-mode-script-padding 4)
  (setq web-mode-style-padding 0)
(add-hook 'web-mode-hook  'my-web-mode-hook)

;; Window management
;(windmove-default-keybindings)
(global-set-key (kbd "C-c <left>")  'windmove-left)
(global-set-key (kbd "C-c <right>") 'windmove-right)
(global-set-key (kbd "C-c <up>")    'windmove-up)
(global-set-key (kbd "C-c <down>")  'windmove-down)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c j")  'windmove-down)
(global-set-key (kbd "C-c <f10>")  'toggle-frame-maximized)
(global-set-key (kbd "C-c <f11>")  'toggle-frame-fullscreen)


;; Global handlers for programming devel
(global-set-key (kbd "C-c e")  'next-error)
(global-set-key (kbd "C-c E")  'previous-error)
(global-set-key (kbd "C-c c")  'comment-or-uncomment-region)


;; Theme zenburn + update to allow correct loading of theme with daemon

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (load-theme 'zenburn t)))
    (load-theme 'zenburn t))

;; whitespace management
;; delete trailing spaces at save
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Change display when reaching the 80 columns edge
(require 'whitespace)
(setq whitespace-style '(face lines-tail trailing))
(setq whitespace-line-column 100) ;; limit line length
(global-whitespace-mode t)

;; Evil mode
(require 'evil)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "<tab>") 'indent-according-to-mode)

;; Custom undo commands
(global-set-key (kbd "C-:")  'undo-tree-redo) ; also C-?

;; Line number + relative
(linum-mode)
(linum-relative-global-mode)
(setq linum-relative-current-symbol "")

;; Magit mode
(global-set-key (kbd "C-x j") 'magit-status)
(global-set-key (kbd "C-x M-j") 'magit-dispatch-popup)

;; NeoTree
(require 'neotree)
(global-set-key [f12] 'neotree-toggle)
;;(setq neo-smart-open t)
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "C-c C-g") 'neotree-refresh)


;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
  )

;; Fasd configuration
(global-set-key (kbd "C-c f") 'fasd-find-file)
(global-fasd-mode 1)

;; Enable elpy
(elpy-enable)
(setq elpy-rpc-virtualenv-path 'current)
(add-hook 'elpy-mode-hook 'blacken-mode)
 
;; Enable pyenv mode
(pyenv-mode)  

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))
;;(setq flycheck-eslint-args "--fix-dry-run")

;; Better display of error messages
(with-eval-after-load 'flycheck
  (flycheck-pos-tip-mode))
(eval-after-load "flycheck"
  '(add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode))

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
    (let ((web-mode-enable-part-face nil))
      ad-do-it)
    ad-do-it))

;; searches the current files parent directories for the
;; node_modules/.bin/ directory and adds it to the buffer
;; local exec-path
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

