;; 6. **Test Block Loop with Unexpected Termination**:    - Description: Implement a loop using a block with an unexpected `return` or `br` breaking the expected flow.    - Constraint: Ensure that unexpected terminations within loops and blocks are handled properly.    - CFG Relevance: Unexpected terminations can lead to broken loops or invalid paths in the CFG.

(assert_invalid
  (module (func $block-loop-unexpected-termination
    (block $outer (result i32)
      (block $inner (result i32)
        (loop
          (br 1 (i32.const 1))  ; branch to $inner block
          (i32.const 0)
          (return)             ; unexpected termination
        )
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)