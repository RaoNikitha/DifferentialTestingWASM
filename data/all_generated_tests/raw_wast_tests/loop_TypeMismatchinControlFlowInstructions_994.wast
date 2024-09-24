;; 5. **Mismatched Result Type in Loop Result Context**:    - A loop, nested within another block or loop, that incorrectly propagates a mismatched result type, while the parent block assumes a different type.    - This tests nested contexts handling and ensuring consistent result type expectations.    - Specific Constraint: Validating correct type summation and propagation in nested contexts.

(assert_invalid
  (module
    (func $nested_mismatched_result
      (result i32)
      (block (result i32)
        (loop (result f32)
          (i32.const 0)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)