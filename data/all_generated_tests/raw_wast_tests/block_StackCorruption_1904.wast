;; Using a `block` that calls several functions with different return types, ensuring that the stack state after each function call correctly matches the overall expected stack state of the block.

(assert_invalid
  (module
    (func $test (result f64)
      (block (result f64)
        (call $fn1)
        (call $fn2)
        (call $fn3)
      )
    )
    (func $fn1 (result f32)
      (f32.const 1.0)
    )
    (func $fn2 (result i32)
      (i32.const 2)
    )
    (func $fn3 (result i64)
      (i64.const 3)
    )
  )
  "type mismatch"
)