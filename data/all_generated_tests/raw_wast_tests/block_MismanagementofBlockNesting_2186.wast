;; 7. **Multiple `br` Instructions in Nested Blocks**:    - Use nested blocks containing multiple `br` instructions at various depths and targets. Verify that each `br` correctly unwinds the operand stack and targets the expected block end based on the branch's label index. Mismanagement in branch depth resolution may lead to errors in operand stack restoration.

(assert_invalid
  (module (func $test-multiple-br (result i32)
    (i32.const 10)
    (block (result i32)
      (block
        (br 1 (i32.const 20))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)