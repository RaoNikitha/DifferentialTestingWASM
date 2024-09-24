;; Develop a scenario where the `br_table` instruction targets a default label mismatch in type compared to all other labels, specifically testing mismanagement of the stack when branching to the default label because the operand types do not align across the labels.

(assert_invalid
  (module 
    (func $mismatched-default-label 
      (block (result i32 i32) 
        (br_table 0 0 (i32.const 0)) 
      ) 
      (i32.const 1)
      (i32.const 2)
    ) 
  ) 
  "type mismatch"
)