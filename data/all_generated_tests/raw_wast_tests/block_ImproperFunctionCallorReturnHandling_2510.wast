;; 1. Create a block that calls an internal function with incorrect parameter types, ensuring the block specifies a mismatching expected result type. This test checks if the operand stack is properly managed during the function call, verifying type-checking and operand stack correctness.

(assert_invalid
  (module
    (func $wrong_param (param i32 i64) (result i32)
      (add (local.get 0) (i64.const 1))
    )
    (func $test_block (result i32)
      (block (result i32)
        (call $wrong_param (i32.const 42) (i32.const 99))
      )
    )
  )
  "type mismatch"
)