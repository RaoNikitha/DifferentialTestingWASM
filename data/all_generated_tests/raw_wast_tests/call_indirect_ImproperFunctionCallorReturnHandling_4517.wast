;; 6. Create a test where `call_indirect` is incorrectly set up with a valid `tableidx` but the function type does not exist in the module, resulting in an invalid `typeidx`. This should validate the constraint and lead to a trap.

(assert_invalid
  (module
    (table 0 funcref)
    (type (func (param i32)))
    (func $invalid-type-idx
      (call_indirect (type 1) (i32.const 0) (i32.const 0))
    )
  )
  "unknown type"
)