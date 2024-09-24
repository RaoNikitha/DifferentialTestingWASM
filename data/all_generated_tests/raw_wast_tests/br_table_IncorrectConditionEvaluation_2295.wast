;; Test 5: Develop a scenario where `br_table` operand stack unwinding results in mismatched operand types, ensuring the proper handling and error reporting of stack inconsistencies. The test focuses on ensuring the stack state remains valid after branching, preventing incorrect stack configurations.

(assert_invalid
  (module
    (func (block (result i32)
      (local i32)
      (i32.const 1)
      (br_table 0 1 (i32.const 0))
    )
    (drop)
  ))
  "type mismatch"
)