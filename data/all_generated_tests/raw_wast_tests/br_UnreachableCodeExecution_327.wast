;; 8. **Sequence of Blocks with Early `br` and Later Unreachable:**    - Sequence multiple blocks where an early `br` targets an outer block, and subsequent blocks contain `unreachable` instructions.    - Validates that the early `br` correctly breaks out, avoiding all later unreachable code segments.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (block
            (br 2)
            (unreachable)
          )
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)