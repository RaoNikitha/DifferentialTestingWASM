;; 1. **Mismatch in Operand Stack Length**:    - Description: Test a `br_table` instruction where the stack lengths of the operand sequences for the default label and various target labels are intentionally mismatched.    - Constraint: This checks if the implementation correctly validates that the operand stack length matches for all labels in the vector against the default label, ensuring no unexpected jumps to an `unreachable` instruction due to inconsistency.    - Relation: A mismatch could lead to incorrect branching or reaching `unreachable` immediately if an implementation skips proper validation.

(assert_invalid
  (module
    (func $mismatch-length
      (block
        (block (result i32) (i32.const 1) (block (result i32) (br_table 1 0 (i32.const 0))))
      )
    )
  )
  "type mismatch"
)