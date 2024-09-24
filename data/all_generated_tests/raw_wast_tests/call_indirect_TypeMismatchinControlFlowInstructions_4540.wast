;; 9. **Mismatched Return Type in Function Table Index Check**:    - Description: Construct a table with functions of varying return types and index into it indirectly using `call_indirect` in a context expecting `i32`, but calling a function that returns `i64`. The expected vs. actual type should cause a mismatch trap.

(assert_invalid
  (module
    (type (func (result i32)))
    (type $sig64 (func (result i64)))
    (table funcref (elem (func (type $sig64))))
    (func $mismatched-return-type
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)