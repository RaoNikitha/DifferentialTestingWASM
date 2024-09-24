;; Test 3: Design a block with a tuple (int, float) output type and use br to branch from the block, but accidentally branch with a float and int in reverse order.

(assert_invalid
  (module
    (func
      (block (result i32 f32)
        (f32.const 0.0)
        (i32.const 1)
        (br 0)
      )
    )
  )
  "type mismatch"
)