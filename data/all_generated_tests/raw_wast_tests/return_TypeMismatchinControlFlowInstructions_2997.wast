;; Function with multiple nested control blocks that each try to return a different type, testing if the outermost block return type consistently adheres to the expected function signature amidst mismatched types.

(assert_invalid
  (module
    (func $test-mismatched-return-types (result i32)
      (block (result f32)
        (block (result i64)
          (i32.const 0)
          (return)
        )
      )
    )
  )
  "type mismatch"
)