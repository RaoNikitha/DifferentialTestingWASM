;; 9. Develop a function making a sequence of valid calls to functions of different return types, then returning a value influenced by these calls. This checks how the mixed return types from various calls are aggregated and propagated.

(assert_invalid
  (module
    (func $func1 (result i32)
      (i32.const 42)
    )
    (func $func2 (result f64)
      (f64.const 3.14)
    )
    (func (result i32)
      (call $func1)
      (call $func2)
      (return)
    )
  )
  "type mismatch"
)