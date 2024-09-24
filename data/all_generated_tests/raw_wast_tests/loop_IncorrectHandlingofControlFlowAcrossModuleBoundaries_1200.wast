;; 1. **Test 1**:    - Description: Create a loop within a function that calls an imported function. The test checks if the loop correctly handles the operand stack when the imported function returns a value.    - Specific Constraint: Ensuring the operand stack is correctly unwound and values are pushed back after calling the imported function.    - Control Flow Relation: Tests the transition of control flow from the local loop to the external module and back, ensuring stack consistency.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_func (result i32)
      (local $temp i32)
      (loop (result i32)
        (call $external_func)
        (set_local $temp)
        (br_if 0 (i32.const 0))
        (get_local $temp)
      )
    )
  )
  "type mismatch"
)