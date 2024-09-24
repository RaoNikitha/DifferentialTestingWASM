;; 4. **Embedding `nop` in Conditional Blocks**:    Embed `nop` within if-else conditional blocks and follow it with `br_if` to jump based on a condition. Confirm the correct block is executed based on the condition and that `nop` does not alter the evaluation.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (if (local.get 0)
        (then (nop) (i32.const 1))
        (else (nop) (i32.const 0))
      )
      (br_if 0 (i32.const 0))
    )
  )
  "type mismatch"
)