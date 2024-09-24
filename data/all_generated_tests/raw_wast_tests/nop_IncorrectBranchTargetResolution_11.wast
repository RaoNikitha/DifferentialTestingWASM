;; 2. **`nop` in Loop with Branching**: Implement a loop containing several `nop` instructions followed by a `br` instruction targeting an outer scope. Verify whether the `nop` instructions cause the `br` to resolve to incorrect targets due to misinterpretation of the stack/frame context.

(assert_invalid
  (module
    (func (result i32)
      (block $outer
        (loop $inner
          nop
          nop
          br $outer
        )
        i32.const 1
      )
    )
  )
  "type mismatch"
)