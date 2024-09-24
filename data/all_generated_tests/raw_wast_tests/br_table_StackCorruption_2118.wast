;; Test 8: Directly employ multiple consecutive `br_table` instructions within a flat structured block, where operand indices are dynamically altered during execution. Assess if the operand stack grows or shrinks inconsistently due to misplaced stack manipulation techniques across the instructions.

(assert_invalid
  (module
    (func $consecutive-br_table-stack-manipulation (result i32)
      (block (br_table 0 1 (i32.const 2)) (i32.const 1))
      (block (br_table 1 2 (i32.const 1)) (i32.const 1))
      (block (br_table 2 0 (i32.const 3)) (i32.const 1))
    )
  )
  "type mismatch"
)