;; - Test 9: Provide an initially valid index but later programmatically modify the control flow to invalidate the index before the `br_table` executes. This tests dynamic validation and proper error propagation.

(assert_invalid
  (module
    (func $dynamic-invalid-br-table
      (block
        (i32.const 1)
        (br_table 0 0 (i32.const 5))
      )
    )
  )
  "unknown label"
)