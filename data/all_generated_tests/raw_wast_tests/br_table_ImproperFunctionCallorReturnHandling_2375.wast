;; 5. **Test Description: Early Return Mechanism:**    - Implement a `br_table` that branches to a return instruction within a complex nested loop and conditional structure.    - **Constraint Checked:** Checks if the `br_table` correctly unwinds the stack and returns early as expected.    - **Relation to Incorrect Return Handling:** Verifies the proper handling of early returns in nested blocks influenced by `br_table`.

(assert_invalid
  (module (func $early-return
    (block (loop (if (i32.eq (i32.const 0) (i32.const 0))
      (then (br_table 0 1 (return (i32.const 0))))
      (else (br 0))
    )))
  ))
  "type mismatch"
)