;; 1. **Test Description: Branch to Label in Nested Blocks with `nop`**    - **Scenario**: Place a `br` (branch) instruction to jump to an outer block, preceded by a `nop` within a nested block.    - **Constraint**: Ensures `nop` does not interfere with the correct label resolution of the `br` instruction out of the nested block.    - **Context**: Misinterpretation might cause the `br` to target the wrong block, disrupting the expected control flow.

(assert_invalid
  (module
    (func (block $outer
      (block $inner
        nop
        br $outer
      )
    ))
  )
  "unknown label"
)