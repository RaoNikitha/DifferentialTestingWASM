;; 9. **Test for Nested Function Type Mismatches**: Use a `loop` inside a function, where the function types declared `[i32, i64] -> [void]`, but the `loop` internally mismatches with results like `[i32, i64] -> [f32]`. This checks nested function and block type handling.

(assert_invalid
  (module (func $nested-function-type-mismatch
    (param i32 i64) (result f32)
    (i32.const 0) (i64.const 1)
    (loop (blocktype f32)
      (drop) (f32.const 0.0)
    )
  ))
  "type mismatch"
)