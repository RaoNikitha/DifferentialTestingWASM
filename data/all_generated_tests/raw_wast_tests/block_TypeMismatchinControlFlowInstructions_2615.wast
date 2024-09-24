;; 6. **Implicit Block Label Mismatch**: Create a `block` expecting a `f64` result, but branch to this block's implicit label with a `br` that assumes and produces an `i64`. This tests the implicit label type management.

(assert_invalid
  (module (func $implicit-block-label-mismatch (result f64)
    (block (result f64)
      (block (result f64) (br 1 (i64.const 0))) (br 0 (f64.const 1.0))
    )
  ))
  "type mismatch"
)