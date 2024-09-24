;; 5. **Deeply Nested Loop with Unreachable**:    - Test a deeply nested loop where an incorrect inner loop control flow could trigger execution of an `unreachable` instruction.    - **Constraint**: Checks the proper nesting and management of multiple loops to ensure accurate execution flow.    - **Unreachable Code Execution**: Ensures that nesting levels are managed correctly, so `unreachable` is not reached.

(assert_invalid
  (module (func $deeply_nested_loop_with_unreachable
    (loop (result i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (i32.const 2)
          (br 0)
          (unreachable)
        )
        (br 0)
      )
    )
  ))
  "type mismatch"
)