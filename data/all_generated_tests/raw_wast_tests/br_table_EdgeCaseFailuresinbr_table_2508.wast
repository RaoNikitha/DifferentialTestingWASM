;; ```  8. **Default Branch to Non-zero Arity**:    ```plaintext    Test a `br_table` where the default branch moves to a label with non-matching operand arity compared to other labels. This focuses on seeing if the arity mismatch is caught correctly during branching.

(assert_invalid
  (module (func $default-branch-arity
    (block (result i32) (br_table 0 0 (i32.const 1) (i32.const 2)) (i32.const 1))
  ))
  "type mismatch"
)