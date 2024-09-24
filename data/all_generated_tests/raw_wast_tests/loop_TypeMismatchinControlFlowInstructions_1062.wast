;; Test 3: Define a loop expecting an integer value on the stack and use a `block` within it that produces a floating-point value. Exiting the block should result in a type mismatch for the loop, testing type consistency across nested blocks.

(assert_invalid
  (module
    (func
      (local i32)
      (i32.const 0)
      (loop
        (block (f32.const 0.0))
        (local.set 0)
      )
    )
  )
  "type mismatch"
)