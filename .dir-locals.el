((org-mode . ((eval . (progn
			(setq org-latex-default-packages-alist nil)
			(setq org-latex-packages-alist nil)
			(setq org-latex-with-hyperref nil)
			(setq org-latex-title-command "")
			(setq org-latex-toc-command "")
			(setq org-latex-pdf-process '("cd %o && latexmk -pdfdvi %f"))
			(setq org-cite-export-processors '((latex bibtex "ipsjsort") 
							   (html csl ".csl-styles/digital-scholarship-in-the-humanities.csl") 
							   (t basic)))
			
			(defun my-html-filter-nobreaks (text backend info)
			  "Remove newlines between CJK characters in HTML export."
			  (when (org-export-derived-backend-p backend 'html)
			    (replace-regexp-in-string 
			     "\\([\u3000-\u9fff\uff00-\uffef]\\)\n\\([\u3000-\u9fff\uff00-\uffef]\\)"
			     "\\1\\2"
			     text)))
			
			(add-to-list 'org-export-filter-plain-text-functions
				     'my-html-filter-nobreaks)

			(defun my-html-image-width (text backend info)
			  "Set all images to width 100% in HTML export."
			  (when (org-export-derived-backend-p backend 'html)
			    (replace-regexp-in-string 
			     "<img src=\"\\([^\"]+\\)\"" 
			     "<img style=\"width:100%\" src=\"\\1\"" 
			     text)))

			(add-to-list 'org-export-filter-final-output-functions
				     'my-html-image-width)))))
 
 (nil . ((eval . (add-hook 'after-save-hook
                           (lambda ()
                             (when (and (buffer-file-name)
                                        (string-match-p "\\.dir-locals\\.el\\'" 
							(buffer-file-name)))
                               (dolist (buffer (buffer-list))
                                 (with-current-buffer buffer
                                   (when buffer-file-name
                                     (hack-local-variables))))))
                           nil t)))))
