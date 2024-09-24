;; 7. Construct a test with nested control blocks where `br` instructions target sibling blocks at different depths. Verify that the operand stack is correctly handled and prevents corruption through sibling branch operations.

(assert_invalid
  (module
    (func $sibling_branch_operand_handling
      (block (result i32)
        (i32.const 10)
        (block (br 1))
        (i32.const 20)
        (block (br 2))
      )
    )
  )
  "type mismatch"
)