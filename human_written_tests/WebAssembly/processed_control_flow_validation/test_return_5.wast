(assert_invalid
  (module
    (func $type-value-empty-vs-num-in-else (result i32)
      (i32.const 0) (i32.const 0)
      (if (result i32) (then (i32.const 0)) (else (return))) (drop)
    )
  )
  "type mismatch"
)