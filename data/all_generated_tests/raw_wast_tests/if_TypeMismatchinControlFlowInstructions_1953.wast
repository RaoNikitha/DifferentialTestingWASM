;; 4. **Test Description**: Create a test with an `if` instruction that conditions an input of type `f64`, triggering the respective branches to handle inputs differently (e.g., `i32` in `then`, `f32` in `else`).    - **Constraint Checked**: Check operand type consistency required by `if` condition and handle branching correctly.    - **Expected Behavior**: The validator should catch the incorrect operand type at the `if` instruction's condition evaluation.

(assert_invalid
  (module
    (func $type-if-mismatched-inputs
      (if (result i32) (f64.const 0.0) 
        (then (i32.const 1)) 
        (else (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)