;; 6. **Test Description: Deeply Nested Blocks with Multiple `nop` and `br`**    - **Scenario**: Create deeply nested blocks containing multiple `nop`, with a `br` instruction jumping to various outer labels.    - **Constraint**: Verifies if multiple `nop` instructions within nested blocks cause mislabeling of branch targets.    - **Context**: Mislabeling can disrupt the deep nesting control flow, causing unexpected jumps or infinite loops.

(assert_malformed
  (module
    (func $deep_nesting
      (block $outer
        (nop)
        (block $inner
          (nop)
          (block $inner_most
            (nop)
            (br $outer)
            (nop)
            (br $inner)
            (nop)
            (br $inner_most)
          )
          (nop)
        )
        (nop)
      )
    )
  )
  "malformed block"
)