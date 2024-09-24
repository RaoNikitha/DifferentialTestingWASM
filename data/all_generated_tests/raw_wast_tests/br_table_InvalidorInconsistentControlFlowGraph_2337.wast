;; 7. Utilize labels in a `br_table` whose types are intentionally mismatched with operands pushed on the stack before the instruction. Ensure operand types are consistent but lengths differ, leading to potential arity mismatches. This verifies CFG correctness in terms of type and operand count alignment.

(assert_invalid
  (module (func $mismatched-types
    (block (result i32)
      (block (br_table 0 0 (i64.const 1)))
      (i32.const 1)
    )
  ))
  "type mismatch"
)