;; Test 1: Create a block with multiple instructions where `br_if` is used based on a condition checked using a local variable set to `0`. Verify that the control flow correctly exits the block only when the condition is met.

(assert_invalid
  (module (func (local i32)
    (block
      (local.set 0 (i32.const 0))
      (br_if 0 (local.get 0))
      (i32.const 1)
    )
  ))
  "type mismatch"
)