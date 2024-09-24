;; Define a block in a function that calls an imported function with a block. Ensure the return values from the nested imported function propagate correctly through the outer block. Validate the operand stack's state before and after the outer block's execution.

(assert_invalid
 (module
  (import "env" "test_func" (func $test_func (result i32)))
  (func $test_block
   (block (result i32)
    (call $test_func)
   )
   (i32.const 0)
  )
 )
 "type mismatch"
)