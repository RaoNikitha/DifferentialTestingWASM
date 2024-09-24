;; 5. **Complex Branch Table with Mismatched Labels**:    - Use a `br_table` within a deeply nested block structure where the labels target blocks with mismatched operand types.    - Evaluate if the implementation correctly resolves the labels and ensures the operand stack types are maintained throughout.

(assert_invalid 
  (module 
    (func $complex-branch-table-mismatched-labels 
      (result i32) 
      (block (result i32) 
        (block (result i32) 
          (block (result i64) 
            (br_table 0 1 2 (i32.const 0)) 
            (i64.const 1) 
          ) 
          (i32.const 2) 
        ) 
        (i32.const 3) 
      ) 
    ) 
  ) 
  "type mismatch" 
)