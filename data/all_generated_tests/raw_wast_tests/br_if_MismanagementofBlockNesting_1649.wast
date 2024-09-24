;; 10. **Test 10: Nested If Blocks with Multiple br_if**     - **Description:** Multiple nested `if` blocks, each containing `br_if` instructions targeting different levels of nested blocks.     - **Constraint Checked:** Proper resolution and execution flow of multiple conditional branches within nested `if` blocks.     - **Mismanagement Relation:** Ensuring that nested if-statements and their branches maintain proper control flow and label referencing.

(assert_invalid
  (module (func $nested-if-multiple-br_if
    (block (result i32) 
      (if (result i32)
        (then 
          (if (result i32) 
            (then 
              (br_if 0 (i32.const 1) (i32.const 1)) 
              (i32.const 2)
            ) 
          )
          (i32.const 3)
        )
      )
      (i32.const 4)
    )
  ))
  "type mismatch"
)