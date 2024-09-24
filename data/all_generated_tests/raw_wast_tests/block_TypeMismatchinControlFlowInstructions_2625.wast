;; - **Test 6 Description**:   Create a scenario where a `block` with expected result type `[i64]` doesn't result in any value being pushed onto the stack. This tests whether the correct type verification is enforced post-block execution.

(assert_invalid
  (module (func $test-block-with-missing-i64-result
    (block (result i64) (nop))
  ))
  "type mismatch"
)