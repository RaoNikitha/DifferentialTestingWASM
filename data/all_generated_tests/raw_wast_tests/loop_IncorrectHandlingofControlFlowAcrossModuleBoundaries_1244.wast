;; 5. **Test: Nested Loops with Cross-Module Function Calls**    Description: Develop nested loops with each level calling imported functions. Verify that control flow and stack management are correctly handled across module boundaries when transitioning between nested loops and function calls.    Constraints:    - Ensure proper nesting of loop blocks.    - Validate operand stack management through nested loop levels.    - Confirm correctness in function call handling between nested loops.

(assert_invalid
  (module
    (import "env" "func_a" (func $func_a (param i32) (result i32)))
    (import "env" "func_b" (func $func_b (param i32) (result i32)))
    (func $test
      (i32.const 1)
      (loop (param i32) (result i32)
        (call $func_a)
        (loop (param i32) (result i32)
          (call $func_b)
          br 1
        )
        i32.const 2
        br 0
      )
    )
  )
  "type mismatch"
)