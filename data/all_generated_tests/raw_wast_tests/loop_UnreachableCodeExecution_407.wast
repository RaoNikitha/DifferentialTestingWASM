;; 8. **Unreachable in Complex Expressions**:    Construct a loop that performs multiple complex stack operations and ends with an `unreachable` inside the loop body. Validate if complex stack manipulations are properly handled before triggering a trap.

(assert_invalid
  (module
    (func $unreachable-in-loop
      (result i32)
      (loop (result i32)
        (i32.const 42)
        (i32.const 0)
        (br_if 0)
        (unreachable)
      )
    )
  )
  "type mismatch or unexpected trap"
)