;; 1. **Nested Loop with Imported Function**:    - Test a function that contains a nested loop, which calls an imported function from within the inner loop. Verify that the stack does not get corrupted and the loop maintains its proper execution flow when transitioning between the calling function and the imported function.    - **Constraint**: Checks correct unwinding and reinitialization of loop stack across function calls.

(assert_invalid
  (module
    (import "env" "externalFunc" (func))
    (func $nested_loop_with_import (result i32)
      (i32.const 0)
      (loop (result i32)
        (block
          ;; Inner loop
          (loop (result i32)
            (call 0) ;; Call imported function
            br 1
          )
        )
      )
    )
  )
  "type mismatch"
)