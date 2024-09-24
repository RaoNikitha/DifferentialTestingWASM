;; 1. Create a test where `br_table` branches to a default label with an i32 value on the stack. Ensure the stack is empty before the branch is taken.

(assert_invalid
  (module
    (func $br_table_default_empty_stack
      (block
        (i32.const 1)
        (br_table 0 (i32.const 0))
      )
    )
  )
  "type mismatch"
)