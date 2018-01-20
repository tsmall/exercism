;;; hello-world.el --- Hello World Exercise (exercism)

;;; Commentary:

;;; Code:
(defun hello (&optional name)
  "Your basic hello world function."
  (if name
      (concat "Hello, " name "!")
      "Hello, World!"))

(provide 'hello-world)
;;; hello-world.el ends here
