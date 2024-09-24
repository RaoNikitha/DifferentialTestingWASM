;; 9. Create a test using `br_table` where the operand stack previously had a function call that leaves extra values on the stack. Ensure the branch correctly manages the additional stack elements.

(assert_invalid
  (module
    (func $test (param i32 i32) (result i32)
      (block $outer (result i32)
        (block $inner (result i32)
          (call $test (i32.const 0) (i32.const 1))
          (br_table $inner $outer (i32.const 2))
        )
      )
    )
  )
  "type mismatch"
)