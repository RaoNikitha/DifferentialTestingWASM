;; 9. **Unaligned Context Labels during Nested Breaks Leading to Unreachable**:    - Design a test with multiple `block` instructions containing break instructions. Misalignment of context labels might lead break instructions to hit an `unreachable` instruction rather than expected handlers.

(assert_invalid
  (module
    (func $unaligned-context-labels (result i32)
      (block $outer (result i32)
        (block $inner
          (br $outer (i32.const 42))
          (br $inner (unreachable))
        )
      )
    )
  )
  "type mismatch"
)