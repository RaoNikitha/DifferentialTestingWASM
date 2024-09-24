;; 10. Formulate a test where a `br_table` instruction follows another branch instruction that slightly modifies the operand stack (e.g., by adding an i32). Design some target labels that fail to account for this modification, causing CFG inconsistencies due to operand stack mismanagement.

(assert_invalid
  (module (func $br_table_with_stack_mod
    (block (block
      (i32.const 42) 
      (br_if 0 (i32.const 1)) 
      (br_table 0 0 (i32.const 2))
    ))
  ))
  "type mismatch"
)