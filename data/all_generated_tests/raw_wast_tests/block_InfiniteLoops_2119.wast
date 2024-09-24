;; 10. **Test 10: Loop with Function Call and Br_If**     - In a `block`, a loop repeatedly calls a function that pushes a value onto the stack. The loop uses `br_if` to check the function result to decide whether to exit.     - Verifies that function results are correctly handled on the stack and branches terminate the loop as expected.

(assert_invalid
  (module
    (func $push_value (result i32)
      i32.const 1
    )
    (func $loop_with_call_and_br_if (result i32)
      (block (loop
        call $push_value
        br_if 0 (i32.const 0)
      ))
    )
  )
  "type mismatch"
)