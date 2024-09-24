;; 2. **Test `if` Instruction with Negative Values**:    - Description: Execute an `if` instruction that checks whether a given negative `i32` operand is non-zero and selects between two instruction sequences.    - Constraint: Confirms that negative integer values are correctly identified as non-zero.    - Incorrect Condition Evaluation: Check if there is a bug in Wizard Engine where it treats negative values as zero, leading to an incorrect branch decision.

(assert_invalid
  (module (func $if-negative-value
    (if (result i32) (i32.const -1)
      (then (i32.const 123))
      (else (i32.const 456))
    )
  ))
  "type mismatch"
)