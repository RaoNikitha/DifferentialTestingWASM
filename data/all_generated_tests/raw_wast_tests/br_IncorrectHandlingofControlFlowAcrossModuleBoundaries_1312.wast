;; 3.  *Test Description*: Execute a branch in an imported function that returns multiple values, and check if the operand stack in the calling module maintains consistency.     *Constraint Being Checked*: Validates that the operand stack unwinding and restoration are correctly handled when crossing module boundaries during function calls and returns.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32 i32)))
    (func $test_func (result i32)
      (block (result i32)
        (call $external_func)
        (br 0)
      )
    )
  )
  "type mismatch"
)