;; 3. **Test Description**:     Design an `if` block that includes a `br_table` within both the `then` and `else` branches, with the `then` branch having a valid index and the `else` branch having an invalid index.    **Constraint**: Checks consistent handling of `br_table` across different branches of the `if` instruction.    **Edge Case Relation**: Verifies differential behaviors in `br_table` index handling depending on the branch executed.

(assert_invalid
  (module (func $br_table-test
    (if (i32.const 1)
      (then (block (br_table 0 1 (i32.const 0))))
      (else (block (br_table 1 0 (i32.const 2)))))
  ))
  "invalid br_table index"
)