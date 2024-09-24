;; - Test 7: Test `br_table` with an index resolved from a stack underflow error (i.e., not enough values on the stack to compute the index). This verifies the handling of unexpected stack conditions.

(assert_invalid
  (module (func $br_table_stack_underflow
    (block
      (br_table 0 1)
    )
  ))
  "stack underflow"
)