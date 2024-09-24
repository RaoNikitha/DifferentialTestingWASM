;; 1. Create a test where `call_indirect` is used with a valid table and function type, but with an index that is out of bounds of the table. This should trigger a boundary check error and result in a trap.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $out-of-bounds
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "out of bounds"
)