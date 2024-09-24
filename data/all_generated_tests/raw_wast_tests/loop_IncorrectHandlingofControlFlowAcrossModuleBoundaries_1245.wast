;; 6. **Test: Loop with Call to Imported Function Modifying Global State**    Description: Implement a loop that calls an imported function modifying a global variable. Ensure the loop can correctly detect and respond to changes in the global state set by the imported function.    Constraints:    - Ensure global variable accessibility across module boundaries.    - Validate the consistency of global state changes within the loop.    - Verify control flow and stack management with altered global state.

(assert_invalid
  (module
    (import "env" "global_val" (global $global_val (mut i32)))
    (import "env" "modify_global" (func $modify_global))
    (func $test_loop
      (loop (result i32)
        (call $modify_global)
        (global.get $global_val)
        (i32.const 5)
        (i32.eq)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)