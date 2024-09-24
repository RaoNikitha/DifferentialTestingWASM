;; 6. **Uninitialized Default Label**    - Provide a `br_table` instruction with an uninitialized or invalid default label index to check if the implementation properly flags an error or defaults to a safe state rather than crashing.

(assert_invalid
  (module (func $uninitialized-default-label
    (block (br_table 0 1))
  ))
  "uninitialized default label"
)