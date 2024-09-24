;; 9. **Test Description**: A `br_table` where the operand index is dynamically computed by preceding instructions and potentially leading to an incorrect label, exploring dynamic operand effects on the branching behavior.

(assert_invalid
  (module (func $dynamic-operand-index
    (block (block (block
      (br_table 0 1 2 (i32.add (i32.const 1) (i32.const 1))))
    ))
  ))
  "unknown label"
)