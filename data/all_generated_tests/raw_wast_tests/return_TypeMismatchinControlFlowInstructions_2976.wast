;; 5. **Test 5 - Branching with Incorrect Types**:    - Description: Use control flow with branching where one branch returns an integer and another a floating-point value. Place a return instruction at the end of each branch.    - Constraint: This ensures that the `return` instruction catches type mismatches when multiple branches are involved.

(assert_invalid
  (module
    (func $branching-with-incorrect-types (result i32)
      (if (i32.const 1)
        (then (return (i64.const 42)))
        (else (return (f32.const 42.0)))
      )
    )
  )
  "type mismatch"
)