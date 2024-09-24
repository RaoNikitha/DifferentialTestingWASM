;; 2. **Bounds Check Failure**: Design a test where the `call_indirect` uses an index that is out of bounds for the table. This should result in a trap due to an invalid table access.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $out-of-bounds-index
      (call_indirect (type 0) (i32.const 5))
    )
  )
  "element index out of bounds"
)