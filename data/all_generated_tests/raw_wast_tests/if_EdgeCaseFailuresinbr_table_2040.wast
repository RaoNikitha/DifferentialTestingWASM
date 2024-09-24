;; 1. **Test Description**:     Create an `if` block where the `else` branch contains a `br_table` instruction with an index exceeding the number of targets.    **Constraint**: Validates that the `br_table` properly handles cases where the index is out of bounds in the `else` branch.    **Edge Case Relation**: Checks how the implementation deals with out-of-bounds indices in `br_table` when nested within the `else` part of an `if` instruction.

(assert_invalid
  (module
    (func $br_table-edge-case (param i32) (result i32)
      (i32.const 1)
      (if (result i32) (i32.const 1)
        (then (i32.const 1))
        (else (br_table 1 (i32.const 1)))
      )
    )
  )
  "type mismatch"
)