;; 1. **Test 1: Stack Mismatch in Simple Loop**    - A block initializes an operand, a loop increments the operand until a condition is met, using `br_if` to exit. Differential stack handling checks for proper operand management and loop exit.    - Checks if the `br_if` successfully exits the loop or improperly maintains the infinite loop.

(assert_invalid
  (module (func $test_stack_mismatch_simple_loop (result i32)
    (block (result i32)
      (i32.const 0)
      (loop (result i32)
        (i32.const 1)
        (i32.add)
        (local.tee 0)
        (i32.const 10)
        (i32.lt_s)
        (br_if 0)
      )
    )
  ))
  "type mismatch"
)