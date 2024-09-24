;; A function with if-else blocks returns different types from each branch, testing type consistency and unwinding through multiple control paths.

(assert_invalid
  (module
    (func $type-value-inconsistent-return (param i32) (result f32)
      (local.get 0)
      (if (result f32)
        (then (i32.const 42) (return))
        (else (f32.const 1.0) (return))
      )
    )
  )
  "type mismatch"
)