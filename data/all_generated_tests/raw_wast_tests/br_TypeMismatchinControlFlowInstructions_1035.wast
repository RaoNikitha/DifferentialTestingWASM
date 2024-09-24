;; Test 6: Create a nested block structure where the inner block outputs a float, and use br from the outer block assuming it outputs an integer, leading to a type mismatch.

(assert_invalid
  (module
    (func
      (block
        (block (result f32)
          (f32.const 1.0)
          (br 1)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)