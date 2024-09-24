;; 3. Use `br_table` with an index equal to the length of the target list to verify if an implicit 'default' branch to the last valid index is consistently handled by both implementations.

(assert_invalid
  (module (func $br_table_default_handling (result i32)
    (block (result i32)
      (br_table 0 1 (i32.const 2))
      (br 0 (i32.const 1))
    )
  ))
  "type mismatch"
)