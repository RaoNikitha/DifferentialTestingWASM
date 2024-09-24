;; 2. **Loop with Conditional Branch to Exported Function**:    - Test a loop that conditionally branches (`br_if`) to an exported function. Ensure that the transition does not cause an incorrect stack height or execution flow, and the branch respects the target function.    - **Constraint**: Verifies correct handling of conditional branches when transitioning across module boundaries.

(assert_invalid 
  (module
    (func $check_condition (param i32) (result i32)
      (local.get 0)
    )
    (export "check_condition" (func $check_condition))
    (func $looping_func (param i32) (result i32)
      (loop (result i32)
        (global.get 0)
        (br_if 0 (call $check_condition (local.get 0)))
      )
    )
  ) 
  "result type mismatch"
)