;; 9. **Test for Indirect Call with Invalid Function Reference in Imported Table**:    Import a table with pre-defined valid and invalid function references. Attempt an indirect call using indices that point to invalid function references. The test must ensure the implementation traps correctly when accessing invalid references.

(assert_invalid
  (module
    (import "m" "t" (table 2 funcref))
    (type (func (param i32) (result i32)))
    (func (export "call_indirect_invalid")
      (call_indirect (type 0) (i32.const 2) (i32.const 0))
    )
  )
  "index out of bounds"
)