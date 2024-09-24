;; 10. **Branched Loop with Recursively Called Functions and Constants**:    - **Description**: Create a loop structure that calls functions recursively, using constants to determine branching within the loop and evaluate `br` instructions.    - **Reason**: Tests the uniform handling of `br` instructions when constants are involved in recursive call scenarios, ensuring that the loop exits correctly without causing infinite loops.

(assert_invalid
  (module
    (type (func (result i32)))
    (func $test (result i32)
      (loop $loop (result i32)
        (call $recurse)
        (i32.const 1)
        (br_if $loop (i32.const 0))
        (return)
      )
    )
    (func $recurse (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)