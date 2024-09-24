;; 7. **Test Description**:    - Construct an `if` instruction set to accept `[i32] -> [f32]`, then enforce the `else` branch to provide an `i64` value.    - **Constraint Checked**: Type inconsistency in the `else` branch output type (`i64`) against the defined `if` block result (`f32`).    - **Target**: Check strict adherence to output types in complex control flow constructs.

(assert_invalid
  (module (func $type-if-mismatch (result f32)
    (if (result f32) (i32.const 1)
      (then (f32.const 1.0))
      (else (i64.const 1))
    )
  ))
  "type mismatch"
)