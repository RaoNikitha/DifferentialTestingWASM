;; 4. **Test Description**:    - Define an `if` instruction with a block type `[] -> [f32]`, having an `else` branch that returns an `i64` value instead.    - **Constraint Checked**: Enforced type consistency between `if` block type and `else` branch output type.    - **Target**: Test whether the engine correctly prevents type inconsistencies.

(assert_invalid 
  (module 
    (func 
      (if (result f32) 
        (then (f32.const 1.0)) 
        (else (i64.const 1))
      )
    )
  ) 
  "type mismatch"
)