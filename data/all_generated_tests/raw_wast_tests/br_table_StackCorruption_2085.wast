;; 5. **Test5: Label Outside Defined Context**    - **Description:** Include a label in the `br_table` vector that references an undefined context or control block.    - **Stack Corruption Check:** Check if the system properly traps or corrupts the stack while handling the erroneous label.

(assert_invalid
  (module (func
    (block (br_table 1 0 (i32.const 0)))
  ))
  "unknown label"
)