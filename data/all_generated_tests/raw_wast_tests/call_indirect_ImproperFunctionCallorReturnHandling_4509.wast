;; 8. **Test Description**: Implement a function table where the function type signature has variadic parameters and call this using `call_indirect` with fixed parameters.    **Constraint Checked**: Tests handling of variadic parameter functions.    **Relation to Improper Handling**: Checks if variadic functions are properly managed in indirect calls, preventing improper call sequences.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (type (func (param i32 i32 i32))) 
    (func $f (param i32 i32))
    (table funcref (elem $f))
    (func $test-call (call_indirect (type 1) (i32.const 0) (i32.const 1) (i32.const 2)))
  )
  "type mismatch"
)