;; 3. **Test for Invalid Type Prepending**: Construct a `loop` where the instruction sequence results in a type stack of `[i32, f32]`, but the `loop`’s block type expects `[f64]`. This will check if the context extension's label stack correctly validates instruction types.

(assert_invalid
  (module (func $test-loop-invalid
    (i32.const 0) (f32.const 0.0) (loop (result f64) (i32.eqz (local.get 0)) (br_if 0) (f32.const 0.0))
  ))
  "type mismatch"
)