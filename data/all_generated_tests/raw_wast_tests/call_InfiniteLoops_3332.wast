;; 1. **Test 1: Conditional Function Call Leading to Infinite Loop**    - **Constraint:** Validate correct handling of conditional function calls within loops.    - **Description:** Create a loop with a `br_if` instruction that conditionally breaks the loop based on the result of a function call. Ensure that improper handling of the function call condition leads to an infinite loop.

(assert_invalid
  (module
    (func $loop-cond-call (param i32) (result i32)
      (loop $loop
        (i32.const 0)
        (call $check-condition)
        (br_if $loop))
      (i32.const 0))
    (func $check-condition (result i32)
      (i32.const 1))
  )
  "type mismatch"
)