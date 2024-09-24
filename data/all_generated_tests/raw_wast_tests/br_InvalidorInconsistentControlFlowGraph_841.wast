;; 2. **Incorrect Operand Handling and Restoration:**    - **Test Description:** Design a test where a `br` instruction targets a `block` with specific operand types `[t*]`. Ensure varied sequences of operand types `t*1` and `t*2` are involved to observe if operand stack unwinding and restoration are managed correctly.    - **Constraint Tested:** Correct operand handling during stack unwinding.    - **CFG Relevance:** Incorrect operand handling can lead to unbalanced stacks, resulting in invalid CFG paths with missing or extra operations.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (br 0 (i64.const 1)) (i32.const 2)
      )
    )
  )
  "type mismatch"
)