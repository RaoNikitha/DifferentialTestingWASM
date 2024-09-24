;; 1. **Test Name: `br_table` with Out of Bounds Index in `then` Block**    - **Description**: This test involves an `if` instruction where the `then` block contains a `br_table` with an index that is higher than the number of targets provided. This should trigger an edge case handling in the `then` block that might be inconsistently managed between implementations.    - **Constraint Checked**: Correct handling of out-of-bounds indices in a `br_table` within an `if` statement in the `then` block.    - **Relation to Edge Case**: Ensures proper error detection and handling for out-of-bounds indices within conditional control flow.

(assert_invalid
  (module (func $br_table-then-block
    (if (i32.const 1) (then (br_table 0 1 (i32.const 2))) (else (nop)))
  ))
  "br_table index out of bounds"
)