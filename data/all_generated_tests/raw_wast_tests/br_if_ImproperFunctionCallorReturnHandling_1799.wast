;; 10. **Test Description**:    - **Test Name**: Conditional Branch Based on Function Side-Effect    - **Description**: Include a `br_if` that operates based on a side-effect produced by a previous function call, such as modifying a global variable.    - **Constraint Check**: Ensures side-effects are correctly detected and used in the conditional branch.    - **Improper Handling**: Validates proper function side-effect management and subsequent conditional branching.  These tests target potential differences in how the operand stack is checked and managed during `br_if` operations, ensuring the correct handling of function calls and returns in diverse control flow scenarios.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $set-side-effect (global.set $g (i32.const 1)))
    (func $br_if-side-effect
      (call $set-side-effect)
      (block (br_if 0 (global.get $g)))
    )
  )
  "unknown label"
)