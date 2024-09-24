;; 8. **Test 8: BrTable with Different Function Signatures**    - Set up a `br_table` where the labels point to functions with different parameter and return types contradicting the expected operand stack types, ensuring that the improper function call/return due to type incompatibility is caught.

(assert_invalid
  (module
    (func $func1 (result i32)
      (i32.const 42)
    )
    (func $func2 (result i64)
      (i64.const 42)
    )
    (func (block (result i32)
      (call $func1)
      (block (result i64)
        (call $func2)
        (br_table 0 1 (i32.const 0))
      )
    ))
  )
  "type mismatch"
)