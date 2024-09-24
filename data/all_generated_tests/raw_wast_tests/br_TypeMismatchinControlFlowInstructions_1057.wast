;; 8. **Test 8: Depth-wisely Inconsistent Label Type Mismatch**    - Create deep nesting with different blocks where an innermost `br` inaccurately aligns with an outer block's `[t*]` type.    - Verifies depth-wise label indexing and relative type consistency across deeply nested blocks.    - Tests index-based type validation affected by nesting depth.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result f32)
          (block (result i64)
            (br 2 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)