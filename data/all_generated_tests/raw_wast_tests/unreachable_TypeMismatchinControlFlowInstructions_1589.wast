;; 10. **Test Description 10:** In a `block` structure that explicitly requires `f64` value, place an `unreachable` in a deeply nested control instruction sequence which otherwise would build up to final stack producing `f64` values. This further ensures implementations can trace type mismatches backward through nested control sequences including unreachable.

(assert_invalid
  (module (func $deep-nested-unreachable (result f64)
    (block (result f64)
      (block (result f64)
        (block (result f64)
          (unreachable)
          (f64.const 1.0)
        )
      )
    )
  ))
  "type mismatch"
)