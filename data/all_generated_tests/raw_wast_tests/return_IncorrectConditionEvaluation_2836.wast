;; 5. Construct a function with a sequence of mixed operations (arithmetic, conditional branches) leading to a `return`. Identify if incorrect `br_if` evaluations cause inconsistent final returned results.

(assert_invalid
  (module
    (func $type-value-mixed-op (result i32)
      (i32.const 1)
      (i32.const 2)
      (i32.add)
      (i32.const 3)
      (i32.eq)
      (if (return (i32.const 4)) (return (i32.const 5)))
    )
  )
  "type mismatch"
)