;; 4. **Default Label Direct Execution**:    - Description: Set a `br_table` with multiple label targets that all point to a valid block except the default label, which points to an `unreachable` instruction.    - Constraint: Ensures the `br_table` correctly diverts to the default label for out-of-bounds operand cases.    - Relation: Tests if the `br_table` misinterprets bounds, potentially reaching an `unreachable` code path erroneously.

(assert_invalid
  (module
    (func (param i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 0 0 (i32.const 2) (local.get 0))
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)