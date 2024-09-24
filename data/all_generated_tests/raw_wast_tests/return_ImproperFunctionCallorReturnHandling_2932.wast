;; 1. **Early Return in a Loop with Multiple Calls**:    - The test involves a loop that calls multiple helper functions and an early `return` instruction within the loop. This checks if the `return` unwinds the stack and exits the outermost block correctly for both implementations.

(assert_invalid
  (module
    (func $early-return-in-loop-with-multiple-calls (result i32)
      (loop (result i32)
        (call $helper1)
        (call $helper2)
        (return (i32.const 42))
        (br 0 (i32.const 0))
      )
      (i32.const 0)
    )
    (func $helper1)
    (func $helper2)
  )
  "type mismatch"
)