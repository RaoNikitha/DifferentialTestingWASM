;; 5. **Conditional Branch with Non-zero Initial Stack Value**    - Implement a loop where the stack is initialized with a non-zero value influencing the `br_if` condition. Verify the loop exits or branches only when the condition becomes zero.    - **Reason**: Ensures `br_if` correctly handles initial non-zero values pushing onto the stack.

(assert_invalid
  (module (func $conditional-branch-non-zero
    (i32.const 5)
    (loop (result i32)
      (i32.const 1)
      (br_if 0)
      (i32.const 0)
      (return)
    )
  ))
  "type mismatch"
)