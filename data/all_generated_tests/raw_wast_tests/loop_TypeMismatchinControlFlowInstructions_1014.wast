;; 5. **Invalid Type in Operand Stack for `br_table`**: Create a loop that uses a `br_table` instruction, where the operand to index into the label table is of the wrong type (e.g., float instead of integer). This will test if the operand type for branch table instructions is properly validated.

(assert_invalid
  (module
    (func $invalid-type-in-br_table-index 
      (f32.const 0.0) 
      (block (loop (block (loop (br_table 0 1 (f32.const 0.0)))))))
  )
  "type mismatch"
)