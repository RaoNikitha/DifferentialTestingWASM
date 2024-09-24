;; 2. **Test Description**: Construct a test using an `if` instruction with `else` branch where the `if` block's output type is `i64`, but the `else` branch attempts to push an `i32` value.    - **Constraint Checked**: Ensure both `then` and `else` branches produce the same output type, matching the block type.    - **Expected Behavior**: The test should highlight any failure to enforce output type consistency between control branches.

(assert_invalid
  (module (func $if-else-type-mismatch (result i64)
    (if (result i64) (i32.const 1) (then (i64.const 42)) (else (i32.const 1)))
  ))
  "type mismatch"
)