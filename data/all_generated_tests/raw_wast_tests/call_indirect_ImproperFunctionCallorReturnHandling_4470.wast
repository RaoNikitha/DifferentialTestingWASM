;; 9. Create a test where a `call_indirect` instruction references a partially initialized table entry to ensure that the implementation can properly trap incomplete or invalid function references.

(assert_invalid
  (module
    (func $f (param i32))
    (type $sig (func (param i32)))
    (table 2 funcref)  ;; Partially initialized table
    (elem (i32.const 0) $f)
    (func
      (call_indirect (type $sig) (i32.const 1)) ;; Access partially initialized entry
    )
  )
  "uninitialized element"
)