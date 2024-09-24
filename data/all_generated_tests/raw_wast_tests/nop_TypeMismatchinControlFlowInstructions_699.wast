;; 10. **Multiple Nops in Sequential Blocks**:     - Several sequential blocks each containing `nop`, followed by type-altering operations.     - The goal is to check cumulative effects of `nop` on sustained type checking across multiple sequential control blocks.     - **Reasoning**: Ensures that sequences of `nop` do not disrupt type constraints continuity across blocks.

(assert_invalid
  (module
    (func (block 
            (nop)
            (block 
              (nop)
              (i32.const 0)
              (br 1)
              (nop)
            )
            (i32.add)
          )
        )
    )
  "type mismatch"
)