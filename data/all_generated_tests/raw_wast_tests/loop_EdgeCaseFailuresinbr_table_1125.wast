;; 6. **Test Description**:    - Formulate a loop with `br_table` using varying types of operands (e.g., floats, integers) and mix valid/invalid types.    - Verify correct operand handling and check for type errors.    - This tests type validation and error handling in `br_table`.    -

(assert_invalid
  (module
    (func
      (loop (block (br_table 0 1 2 (i32.const 0))))
    )
  )
  "type mismatch"
)