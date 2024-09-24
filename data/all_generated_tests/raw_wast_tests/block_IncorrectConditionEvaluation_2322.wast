;; Test 3: Implement a block that includes an `if` statement with a negated condition (`br_if` with condition `0`). Ensure that the correct path is taken and the block does not exit prematurely.

(assert_invalid
  (module (func $block_with_negated_if
    (block (result i32)
      (i32.const 1)
      (br_if 0 (i32.const 0))
      (i32.const 2)
    )
  ))
  "type mismatch"
)