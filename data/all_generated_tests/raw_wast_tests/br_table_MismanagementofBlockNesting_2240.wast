;; 10. **Test Description:** Structure a complex nested setup where `block`s with varying arity levels contain `br_table` instructions. The test validates if the branch instruction manages operand types reliably, preventing unintended exits from nested blocks due to stack and label index mismatches.

(assert_invalid
  (module (func
    (block (label $outer (result i32 i32)
      (block (label $inner (result i64)
        (br_table 0 1 2 (i32.const 0) (i32.const 1) (i32.const 2))
      ))
    ))
  ))
  "type mismatch"
)