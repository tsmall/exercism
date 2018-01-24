;;; gigasecond.el --- Gigasecond exercise (exercism)

;;; Commentary:
;; Calculate the date one gigasecond (10^9 seconds) from the
;; given date.
;;
;; NB: Pay attention to  Emacs' handling of time zones and dst
;; in the encode-time and decode-time functions.

;;; Code:

(defconst one-gigasecond (expt 10 9)
  "One gigasecond in seconds.")

(defconst utc-timezone 0
  "Representation of the UTC time zone.")

(defun from (second minute hour day month year)
  "Returns the time one gigasecond from the time provided."
  (let* ((given-time (encode-time second minute hour day month year utc-timezone))
         (later-time (time-add given-time one-gigasecond))
         (decoded-time (decode-time later-time utc-timezone)))
    (butlast decoded-time 3)))

(provide 'gigasecond)
;;; gigasecond.el ends here
