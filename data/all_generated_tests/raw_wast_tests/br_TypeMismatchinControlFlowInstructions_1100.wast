;; 1. **Test for Mismatched Block Result Types**: Create a `block` with an expected result type of `i32`, but mistakenly include `f32` operations within the block. The `br` instruction will attempt to branch to this block, expecting an `i32` on the stack, which should raise an error in strict type-checking implementations but may be mishandled in others.

(assert_invalid
  (module
    (func $mismatched-block-result
      (block (result i32)
        (f32.const 0.0)
        (br 0)
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)