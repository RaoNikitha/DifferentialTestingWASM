;; Test 8: Formulate a nested block structure where an outer block expects an f32 result. Use a br instruction within an inner block to target the outer block but place an i64 type on the operand stack, checking proper label resolution and stack handling.

(assert_invalid
  (module
    (func $nested-block
      (block (result f32)
        (block
          (i64.const 0)
          (br 1)
        )
        (f32.const 1.0)
      )
    )
  )
  "type mismatch"
)