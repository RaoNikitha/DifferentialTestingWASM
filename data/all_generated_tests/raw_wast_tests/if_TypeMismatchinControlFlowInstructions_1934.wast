;; 5. **Test with Nested If Instructions Having Mismatched Types**: Create a module where nested `if` instructions have differing `blocktypes`. Specifically, the inner `if` might expect a `f32` and the outer `if` expects an `i64`. This tests the propagation and enforcement of type constraints in nested contexts.

(assert_invalid
  (module
    (func (result i64)
      (if (result i64)
        (if (result f32)
          (i32.const 1)
          (then (f32.const 0.0))
          (else (f32.const 1.1))
        )
        (then (i64.const 0))
        (else (i64.const 1))
      )
    )
  )
  "type mismatch"
)