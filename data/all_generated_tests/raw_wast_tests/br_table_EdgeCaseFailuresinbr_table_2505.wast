;; ```  5. **Non-matching Operand Types**:    ```plaintext    Create a `br_table` where the operand types in the branches do not match the default label's operand types. This verifies whether mismatched types trigger arity errors and proper default label jumping.

(assert_invalid
  (module (func
    (block (result i32)
      (block
        (block (result i64)
          (br_table 0 1 (i32.const 0) (i32.const 1))
        )
      )
    )
  ))
  "type mismatch"
)