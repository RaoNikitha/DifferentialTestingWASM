;; ```  3. **Non-zero Default Index with Empty Label Vector**:    ```plaintext    Validate a `br_table` with an empty label vector but a non-zero default label index. This ensures correct default label handling and early error detection of arity mismatches.

(assert_invalid
  (module (func $non_zero_default_label_with_empty_vector
    (block
      (br_table 0 (i32.const 1))
    )
  ))
  "unknown label"
)