;; 10. Test Description: **Branch to Non-Existent Label in Well-Nested Structure**     - **Constraint Checked:** Validity of label existence within nested block structures.     - **How it Relates:** Ensures that referencing non-existent labels within a nested block correctly traps or defaults rather than undefined behavior.

(assert_invalid
  (module (func $branch non-existent-label-nested
    (block 
      (block 
        (br_table 0 2 (i32.const 2))
      )
    )
  ))
  "unknown label"
)