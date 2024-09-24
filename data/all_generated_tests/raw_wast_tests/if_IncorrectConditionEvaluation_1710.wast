;; 1. **Test Description**:    - **Test Name**: MismatchedElseCondition    - **Test Goal**: Verify if a conditional `else` is correctly checked when an `if` condition is false.    - **Specific Constraint**: Ensure that the `else` block executes only when the `if` condition is zero.    - **Relation to Incorrect Condition Evaluation**: Tests whether `else` executes incorrectly due to condition misinterpretation.

(assert_invalid
 (module (func $mismatched-else-condition (result i32)
   (i32.const 0)
   (if (result i32)
     (then (i32.const 42))
     (else (i32.const 42) (i32.const 1))
   )
 ))
 "type mismatch"
)