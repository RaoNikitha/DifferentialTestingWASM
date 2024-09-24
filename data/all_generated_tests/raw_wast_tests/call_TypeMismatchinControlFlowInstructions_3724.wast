;; - **Test 3**: Create a nested `block` structure where the inner block's call instruction expects a `i64`, but the outer block results in `f32`. This test will validate type consistency across nested control flow instructions.

(assert_invalid
  (module
    (func $outer
      (block (result f32)
        (block (result i64)
          (call $inner (i32.const 1)) (i64.const 0)
        )
        (f32.const 0.5)
      )
    )
    (func $inner (param i32) (result i64)
      (i64.const 2)
    )
  )
  "type mismatch"
)