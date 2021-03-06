(in-package :cl-user)
(defpackage hermetic-asd
  (:use :cl :asdf))
(in-package :hermetic-asd)

(defsystem hermetic
  :version "0.1"
  :author "Fernando Borretti"
  :license "MIT"
  :homepage "https://github.com/eudoxia0/hermetic"
  :depends-on (:clack
               :cl-pass)
  :components ((:module "src"
                :components
                ((:file "hermetic"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.md"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (load-op hermetic-test))))
