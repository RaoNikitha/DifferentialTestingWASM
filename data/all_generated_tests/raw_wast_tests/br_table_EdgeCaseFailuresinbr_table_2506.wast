;; ```  6. **Invalid Target Label**:    ```plaintext    Design a `br_table` instruction referencing an invalid label index within a small label vector. This functional edge case should trigger verification on mis-indexing and proper error handling.

(assert_invalid
  (module
    (func $invalid-target-label
      (block $label0
        (i32.const 3)
        (br_table 0 1 (i32.const 1))
      )
    )
  )
  "unknown label"
)