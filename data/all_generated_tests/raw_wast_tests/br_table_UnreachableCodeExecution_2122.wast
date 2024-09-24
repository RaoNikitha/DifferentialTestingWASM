;; 2. **Operand Type Mismatching**:    - Description: Construct a test where the operand type sequence for at least one of the labels differs from the default label.    - Constraint: Verifying the type matching between the operand stacks of the target labels and default label and the type propagation through indexed labels.    - Relation: Incorrect type matching could cause improper execution flow, leading to unintended `unreachable` instruction execution.

(assert_invalid
 (module
  (func (param i32) (result i32)
    (block (result i32)
      (loop (result i32)
        (br_table 0 1 (i32.const 1) (local.get 0))
      )
    )
    (i32.const 0) (i32.eqz) (drop)
  )
 )
 "type mismatch"
)