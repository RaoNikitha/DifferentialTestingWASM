;; 1. **Test Description**: Load a function table with multiple entries where some entries have invalid function types. Perform a `call_indirect` with an index pointing to an invalid entry. Ensure that a trap occurs due to type mismatch branching to a specific error handler.

(assert_invalid
  (module
    (type $valid_sig (func (param i32) (result i32)))
    (type $invalid_sig (func (param i64) (result i64)))
    (func $f1 (param i32) (result i32) (i32.const 0))
    (func $f2 (param i64) (result i64) (i64.const 0))
    (table funcref (elem $f1 $f2))
    (func (result i32)
      (i32.const 1)
      (call_indirect (type $valid_sig) (i32.const 0))
    )
  )
  "type mismatch"
)