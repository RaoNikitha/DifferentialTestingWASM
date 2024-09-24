;; 1. **Test: Loop with Nested Call to Imported Function**    Description: Create a `loop` that calls an imported function within its body. Ensure the imported function modifies the operand stack. Verify that control flow returns to the correct point in the loop after the function call. This tests the correct handling of operand stack and control flow across module boundaries.    Constraints:     - Ensure the loop block type is consistent.    - Validate that operand stack manipulation in the imported function does not disrupt the loop.    - Verify correct resumption of loop execution post-function call.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test_func
      (i32.const 0)
      (loop (result i32)
        (call $external_func (i32.const 1))
        (drop)
        (br 0)
      )
    )
  )
  "type mismatch"
)