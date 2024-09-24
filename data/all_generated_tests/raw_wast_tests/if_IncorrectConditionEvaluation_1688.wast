;; 9. **Test `if` Instruction with Data Stack Manipulation**:    - Description: A scenario where data stack changes within `if` blocks and affects subsequent `if` condition evaluations.    - Constraint: Verifies that stack manipulation and resulting conditions maintain consistency.    - Incorrect Condition Evaluation: Ensure Wizard Engine correctly maintains operand stack resulting in accurate `if` condition checks.

(assert_invalid
  (module (func $test-stack-manipulation (result i32)
    (if (result i32) (i32.const 0)
      (then (drop) (i32.const 2))
      (else (i32.const 1) (i32.const 2))
    )
    (if (result i32) (i32.const 0)
      (then (i32.const 10))
      (else (drop) (i32.const 20))
    )
  ))
  "type mismatch"
)