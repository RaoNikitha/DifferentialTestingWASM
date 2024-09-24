;; 1. **Test a Call to an Imported Function Returning Multiple Values**    - Check if the `block` correctly handles a call to an imported function that returns multiple values. Ensure that after the call, the stack state is correct.    - This test will examine if the stack maintains the correct values across module boundaries, focusing on label stack management discrepancies.

(assert_invalid
  (module
    (import "env" "multi_result_func" (func $multi_result_func (result i32 f32)))
    (func (result i32 f32)
      (block (result i32 f32) (call $multi_result_func))
    )
  )
  "type mismatch"
)