;; 3. **Misaligned Nested Blocks**:    - Include deeply nested blocks with types that produce and consume different stack states, ensuring that the inner block type does not fit the outer block's requirements.    - This test checks the handling of nested block stack states and the control flow validation.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result f64)
        (i32.const 0)
      )
    )
  ))
  "type mismatch"
)