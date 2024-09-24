;; 3. **Test for Stack State Preservation Across Modules**:    Make a series of indirect calls that involve imported functions and verify if the operand stack state remains consistent. Use complex stack manipulation before and after the calls to detect any corruption or inconsistency in the stack state as the control flows across modules.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (import "env" "external_function" (func $external_function (param f64) (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) $external_function)
    (func $test_stack_state
      (i32.const 42) (f64.const 3.14)
      (call_indirect (type 0) (i32.const 0) (i32.const 123) (i32.const 456))
      (i64.const 0) ;; Manipulate stack
    )
  )
  "type mismatch"
)