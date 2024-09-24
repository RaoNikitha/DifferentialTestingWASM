;; 2. Call a function within a block where the function requires integer parameters but the block passes floating-point values.

(assert_invalid
  (module
    (func $target (param i32))
    (func $test
      (block
        (call $target (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)