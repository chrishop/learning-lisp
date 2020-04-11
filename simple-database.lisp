(defvar *db* nil)

(defun make-record (title artist date) 
  (list :title title :artist artist :date date))

(defun add-record (record) (push record *db*))

(defun show-db ()
  (dolist (item *db*)
    (format t "~{~a:~10t~a~%~}~%" item)))

(defun prompt-for-record ()
  (make-record
    (prompt-read "Title")
    (prompt-read "Artist")
    (prompt-read "Date")))

(defun prompt-read (prompt)
  (format *query-io* "~a: " prompt)
  (force-output *query-io*)
  (read-line *query-io*))