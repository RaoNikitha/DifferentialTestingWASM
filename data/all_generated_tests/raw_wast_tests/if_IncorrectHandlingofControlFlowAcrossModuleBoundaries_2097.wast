;; 8. **Test 8: Deeply Nested If Blocks with Different Module Imports**:    - Description: Construct deeply nested `if` blocks with calls to different imported functions from various modules, validating control flow and stack states.    - Specific Constraint: Ensure nested `if` layers correctly handle transitions and the operand stack across multiple module imports.    - Relation to Control Flow: Evaluates deep nesting and multiple module transitions, ensuring consistent stack and label handling.

(assert_invalid
  (module
    (import "module1" "func1" (func $func1 (result i32)))
    (import "module2" "func2" (func $func2))
    (func (result i32)
      (if (result i32)
        (call $func1)
        (then
          (call $func2)
          (if (result i32)
            (call $func1)
            (then (i32.const 42))
            (else (i32.const 0))
          )
        )
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)