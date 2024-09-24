;; 8. **Test Description**: Validate an `if` where both `then` and `else` blocks end in a `br_table` with an invalid default target.    - **Constraint**: Ensure that the `if` instruction handles the default target of `br_table`, especially when it is invalid.    - **Relation to Edge Case**: Checks the handling of default branches in `br_table` within the structured flow of `if`.

(assert_invalid
  (module (func $if-with-br_table-invalid-default (result i32)
    (if (result i32) (i32.const 1)
      (then (br_table 0 1 (i32.const 0)) (i32.const 1))
      (else (br_table 0 1 (i32.const 0)) (i32.const 1))
    )
  ))
  "type mismatch"
)