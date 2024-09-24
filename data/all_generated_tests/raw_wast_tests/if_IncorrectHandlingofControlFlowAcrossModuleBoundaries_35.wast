;; 6. Design an `if` block that imports and calls a function returning multiple values. Ensure that both branches of the `if` handle the multiple returned values correctly according to the blocktype.

(assert_invalid
  (module
    (import "env" "multi_result_func" (func $multi_result_func (result i32 i64)))
    (func $test_if (result i32 i64)
      (i32.const 1)
      (if (result i32 i64)
        (call $multi_result_func)
        (then
          (i32.const 10) (i64.const 20)
        )
        (else
          (call $multi_result_func)
        )
      )
    )
  )
  "type mismatch"
)