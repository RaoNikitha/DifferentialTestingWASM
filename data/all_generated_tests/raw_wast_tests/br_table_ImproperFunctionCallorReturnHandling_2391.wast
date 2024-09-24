;; 1. **Test 1: Function Call with Insufficient Stack Cleanup**    - Description: Test calling a function within a block that leaves values on the stack and then attempts to branch using `br_table` to multiple labels. Check if the stack is correctly cleaned up.    - Constraint Checked: Stack unwinding and operand matching after function call within `br_table`.    - Improper Function Call or Return Handling: Ensuring proper stack cleanup and handling after function call so the branch executes correctly.

(assert_invalid
 (module
  (func $test
   (block
    (call $some_func)
    (br_table 0 1 2 (i32.const 0))
   )
  )
  (func $some_func (nop))
 )
 "unknown label"
)