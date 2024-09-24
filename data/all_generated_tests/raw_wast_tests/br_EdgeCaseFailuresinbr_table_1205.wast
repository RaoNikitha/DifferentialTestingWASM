;; 6. Implement a `br_table` with varying stack heights for each target. This checks if the operand stack is correctly unwound and operands are appropriately managed, relating to operand stack management constraints.

(assert_invalid
  (module (func $br_table-inconsistent-stack-heights
    (block (result i32) 
      (br_table 0 1 (i32.const 0) (i32.const 1) (i64.const 1) (nop))
    )
  ))
  "type mismatch"
)