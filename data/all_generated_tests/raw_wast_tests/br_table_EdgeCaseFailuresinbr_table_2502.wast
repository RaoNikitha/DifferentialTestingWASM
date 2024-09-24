;; ```  2. **Zero Labels Vector**:    ```plaintext    Test a `br_table` instruction with an empty label vector and an operand index. This tests if the instruction properly jumps to the default label and verifies arity checks in the absence of any branch targets.

(assert_invalid
  (module (func
    (block
      (br_table 0 (nop))
    )
  ))
  "unknown label"
)