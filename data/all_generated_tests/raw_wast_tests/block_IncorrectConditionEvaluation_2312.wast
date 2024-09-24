;; 3. Test a `block` with mixed data types and `br_if` conditions within it, verifying that the correct data types are pushed and popped from the stack when the condition evaluates to true or false.

(assert_invalid
  (module (func $mixed-types-block-br_if (result i32)
    (block (result i32)
      (i32.const 42)
      (i64.const 99)
      (br_if 0 (i32.const 1))
      (i32.const 1)
    )
  ))
  "type mismatch"
)