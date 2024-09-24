;; 7. **Test 7: Late Stage Function Return**    - Description: Implement a function return just before a `br_table` instruction in nested blocks to test if all returns are handled consistently.    - Constraint Checked: Proper return handling and control flow leading into `br_table`.    - Improper Function Call or Return Handling: Verifying consistency in function return handling immediately before complex branching.

(assert_invalid
  (module
    (func $late_stage_return
      (block
        (block
          (block
            (return (i32.const 42))
            (br_table 0 1 2 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)