;; 1. **Test `if` Instruction with Simple Numeric Comparison**:    - Description: Execute an `if` instruction that checks whether a given `i32` operand is non-zero and executes two different code blocks based on the evaluation.    - Constraint: Ensures that the `i32` comparison is correctly evaluated, and the correct branch is taken based on the non-zero condition.    - Incorrect Condition Evaluation: Validate if Wizard Engine incorrectly evaluates zero as non-zero, leading to the wrong branch execution.

(assert_invalid
  (module
    (func $simple-numeric-comparison (result i32)
      (local $x i32)
      (local.set $x (i32.const 0))
      (if (result i32)
        (local.get $x)
        (then (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)