;; Test 9: Formulate a block where the instructions within use stack manipulations such that the intended result type of the block cannot be met. This tests the operand stack behavior for type mismatches and error propagation through CFG.

(assert_invalid
  (module
    (func $block-stack-manipulation-mismatch
      (block (result i32)
        (i32.const 42)
        (drop)
        (i64.const 64)
      )
    )
  )
  "type mismatch"
)