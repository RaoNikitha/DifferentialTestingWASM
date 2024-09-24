;; 5. **Nested `br_table` Instructions**:    - Description: Deploy a series of nested `br_table` instructions, where an inner `br_table` incorrectly jumps to an `unreachable` instruction if the outer `br_table`’s indexing misbehaves.    - Constraint: Examines the correct implementation of label indexing within nested control flow structures.    - Relation: Incorrect execution would wrongly assess boundaries leading to `unreachable` executions.

(assert_invalid
  (module (func $nested-br_table
    (block (block (block
      (br_table 1 0 (i32.const 1))   ; Outer br_table
      (br_table 0 (unreachable))     ; Inner br_table
    )))
  ))
  "unknown label"
)