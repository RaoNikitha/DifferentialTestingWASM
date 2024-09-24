;; - Test 1: Create a loop that initializes and iterates over a set of values. Use `br` to create a backward jump. Ensure varying input values to test for stack underflows when multiple branches occur within the loop. Check if the stack is properly re-initialized upon each backward jump.

(assert_invalid
  (module (func $test-loop-stack-underflow
    (loop (result i32)
      (i32.const 10)
      (br 0)
      (drop)
    )
  ))
  "type mismatch"
)