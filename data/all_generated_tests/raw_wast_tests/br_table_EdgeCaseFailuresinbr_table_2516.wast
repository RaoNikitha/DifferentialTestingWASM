;; 5. Test Description: **Maximum Integer Index Operand**    - **Constraint Checked:** Using the maximum possible integer value for the operand.    - **How it Relates:** It verifies that excessively large indices do not break the instruction and appropriately select the default label.

(assert_invalid
  (module (func $max-int-index-operand
    (block (br_table 0 0 0xFFFFFFFF (i32.const 2147483647)))
  ))
  "unknown label"
)