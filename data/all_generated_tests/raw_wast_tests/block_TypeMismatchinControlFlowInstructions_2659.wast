;; Test 10: Create a block with multiple nested blocks, each with differing result types (e.g., inner block resulting in f32, outer block resulting in i64). Ensure proper validation of type transitions between nested block contexts.

(assert_invalid
  (module (func
    (block (result i64)
      (block (result f32)
        (f32.const 0.0)
      ) 
      (i64.const 1)
    )
  ))
  "type mismatch"
)