;; 9. **Branch with Indirect Return from Block:**    - **Test Description:** Include an indirect branch (`br_table`) within a block directing to a return path, verifying that function returns are correctly handled.    - **Constraint Checked:** Label indexing and return path verification within block and indirect branching.    - **Relation to Improper Function Handling:** Ensure function return paths are correctly followed with indirect branching from within blocks.

(assert_invalid
  (module (func $indirect-branch-return (result i32)
    (block (result i32)
      (i32.const 0)
      (i32.const 1)
      (br_table 0 1)
      (return (i32.const 42))
    )
  ))
  "type mismatch"
)