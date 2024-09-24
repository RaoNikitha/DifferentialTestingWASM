;; 2. Define a nested block where the outer block expects an `i32` type but the inner block ends with an `f64` type. This checks whether label management correctly identifies type mismatches within nested blocks in both implementations.

(assert_invalid
  (module
    (func $nested-block-type-mismatch
      (block (result i32)
        (block (result f64)
          (f64.const 1.0)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)