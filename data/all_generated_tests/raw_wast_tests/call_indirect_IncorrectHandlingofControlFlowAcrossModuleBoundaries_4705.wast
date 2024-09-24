;; 4. An indirect call to an imported function that returns multiple result values should place all results correctly on the operand stack, ensuring proper stack operations across boundaries.

(assert_invalid
  (module
    (type $sig_multi_result (func (result i32 i64)))
    (import "env" "multi_result_func" (func $multi_result_func (type $sig_multi_result)))
    (table 1 funcref)
    (elem (i32.const 0) $multi_result_func)
    (func $test_indirect_call
      (call_indirect (type $sig_multi_result) (i32.const 0))
    )
  )
  "type mismatch"
)