;; 7. **Complex Conditional with `br` and Unreachable in Nested `if` Blocks:**    - Design nested `if` blocks with conditions leading to a `br` targeting an outer block, and place `unreachable` instructions within the alternative paths.    - Checks that the `br` instruction does not accidentally execute alternate unreachable paths.

(assert_invalid
  (module
    (func
      (block $outer (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (br $outer)
          )
          (else
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)