;; 10. **Type Mismatch in Function Table Indirection**:    Use a function table to indirectly call another function within a loop, where the expected result type of the loop is `f64`, but the function table contains functions returning `i32`. Validate the handling of type mismatches arising from indirect calls within control flow structures.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (type $loop_sig (func (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (result i32) (i32.const 0))
    (func $test
      (loop (call_indirect (type $loop_sig) (i32.const 0)))
    )
  )
  "type mismatch"
)