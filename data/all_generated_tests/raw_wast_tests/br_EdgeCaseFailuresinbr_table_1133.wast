;; 4. **Empty Table Case:**    - Use a `br_table` instruction with an empty targets list and provide any index. This verifies if the implementation falls back to the default label when no targets are defined.    - **Constraint:** Ensures correct default label handling when no specific targets are available.

(assert_invalid
  (module (func $empty-table
    (block
      (br_table 0 [])
    )
  ))
  "invalid indexing"
)