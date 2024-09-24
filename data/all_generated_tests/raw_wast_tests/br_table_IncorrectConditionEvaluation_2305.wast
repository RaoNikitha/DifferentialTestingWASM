;; 5. **Test 5**: Create a test where the `br_table` uses a zero-length label vector with a valid default label. Use a non-zero operand and verify if `wizard_engine` triggers a mismatch error early, compared to `WebAssembly` potentially processing further.

(assert_invalid
  (module
    (func $zero-length-vector-non-zero-operand
      (block
        (i32.const 1)
        (br_table  (i32.const 0))
      )
    )
  )
  "type mismatch"
)