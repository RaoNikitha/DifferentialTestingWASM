;; 1. **Testing Incorrect Block Result Type:**    - Create a test with a `block` that expects an `i32` result type but is branched to by a `br` instruction providing a `f32` operand. This checks if the branch verifies the operand type matches the block's expected result type.

(assert_invalid
  (module
    (func $incorrect-block-result-type
      (block (result i32)
        (br 0 (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)