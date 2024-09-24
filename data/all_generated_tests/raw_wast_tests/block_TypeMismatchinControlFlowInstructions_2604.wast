;; Test 5: Use a nested block where the outer block expects `i32` values and the inner block processes `f32`. This tests if branch instructions within nested blocks correctly identify and handle the type mismatches between different levels of block types.

(assert_invalid
  (module (func $nested-block-type-mismatch
    (block (result i32)
      (block (result f32) (br 1 (i32.const 1))) (br 0 (f32.const 1.0))
    )
  ))
  "type mismatch"
)