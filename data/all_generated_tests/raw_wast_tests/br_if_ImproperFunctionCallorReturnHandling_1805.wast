;; 6. **Test: Function Call With a Spurious Conditional Branch**    - **Description:** Invoke a function that contains a `br_if` with a condition that should never be true. Ensure the function’s return is handled correctly with no unintended jumps or stack anomalies.    - **Constraint Check:** Verifies that improper function returns do not trigger accidental branches or stack corruption.

(assert_invalid
  (module (func $spurious-branch (result i32)
    (block $label1 (return (i32.const 42)) (br_if $label1 (i32.const 0)))
  ))
  "return value mismatch"
)