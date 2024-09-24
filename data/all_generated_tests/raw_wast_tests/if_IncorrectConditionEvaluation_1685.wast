;; 6. **Test `if` Instruction with Complex Expression Evaluation**:    - Description: An `if` statement where the condition is a result of complex `i32` arithmetic expression that evaluates to zero or non-zero.    - Constraint: Ensures complex expressions for conditions are evaluated correctly.    - Incorrect Condition Evaluation: Validate if complex condition results are mishandled by Wizard Engine causing erroneous branches.

(assert_invalid
  (module
    (func $complex-if (result i32)
      (i32.const 10)
      (i32.const 2)
      (i32.mul)
      (i32.const 4)
      (i32.div_s)
      (i32.const 0)
      (if (result i32)
        (then (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)