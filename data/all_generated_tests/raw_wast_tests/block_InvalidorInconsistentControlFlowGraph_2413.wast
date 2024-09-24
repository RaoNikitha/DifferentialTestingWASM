;; Test 4: Implement a block with mismatched result types by having instructions that lead to a different number of values on the stack than the block type expects. This tests the CFG handling of the stack state consistency.

(assert_invalid
  (module (func $type-mismatch-stack-state (result i32)
    (block (result i32)
      (i32.const 1)
      (f64.const 0.0)
    )
  ))
  "type mismatch"
)