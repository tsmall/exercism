;;; robot-name.el --- Robot Name (exercism)

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;

;;; Code:

(require 'eieio)

(defclass robot ()
  ((name :initarg :name
         :type string)))

(defun build-robot ()
  "Builds a brand new robot."
  (robot :name (generate-robot-name)))

(defun robot-name (robot)
  "Returns the ROBOT's current name."
  (oref robot name))

(defun reset-robot (robot)
  "Resets the ROBOT's name to a newly generated one."
  (oset robot name (generate-robot-name)))

(defun generate-robot-name ()
  "Generate a new robot name."
  (concat
   (string (random-char))
   (string (random-char))
   (number-to-string (random 9))
   (number-to-string (random 9))
   (number-to-string (random 9))))

(defun random-char ()
  "Returns a pseudo-random uppercase character (A-Z)."
  (let* ((n (random 25))                 ; Get a random number
         (c (+ n 65)))                   ; Make it in range A-Z
    c))

(provide 'robot-name)
;;; robot-name.el ends here
