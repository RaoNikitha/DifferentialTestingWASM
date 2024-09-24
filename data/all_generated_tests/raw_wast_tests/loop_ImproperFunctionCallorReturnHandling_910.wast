;; 1. **Test: Conditional Function Call in a Loop**     - Description: Create a loop instruction that includes a conditional branch (`br_if`) to a `call` function instruction. The function being called should perform a simple arithmetic computation. Check if the function call is properly executed when the condition is met and skipped otherwise.     - Constraint: Validates correct branching and stack unwinding before a function call within a loop block.

(assert_invalid
  (module
    (func $test_loop_conditional_call
      (local i32)
      (i32.const 0)
      (local.set 0)
      (loop (result i32)
        (local.get 0)
        (i32.const 10)
        (i32.lt_s)
        (br_if 0)
        (local.get 0)
        (i32.const 1)
        (i32.add)
        (local.set 0)
        (call $simple_math_operation)
        (br 1)
      )
      (i32.const 0)
      (return)
      (unreachable)
    )
    (func $simple_math_operation (param i32) (result i32)
      (local.get 0)
      (i32.const 2)
      (i32.add)
    )
  )
  "type mismatch"
)