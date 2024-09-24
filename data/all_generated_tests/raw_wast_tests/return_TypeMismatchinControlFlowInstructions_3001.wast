;; A function returns from a labeled block that mistakenly returns a complex type instead of the expected primitive type, testing type matching and forward branch condition handling by each engine.

(assert_invalid
  (module
    (func $type-complex-vs-primitive (result i32)
      (block $label (f64.const 0.0) (return))
    )
  )
  "type mismatch"
)