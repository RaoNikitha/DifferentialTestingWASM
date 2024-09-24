;; 3. **Test 3: Nested Loop with Multiple Imports**:    - A nested loop structure where the inner loop repeatedly calls two different imported functions, one modifying the stack.    - **Constraint Checked**: Checks correct handling of control flow and stack management in nested loops with multiple imported function calls.    - **Relevance**: Complexity of nested loops with multiple imports could reveal bugs in context extension and stack reinitialization.

(assert_invalid
  (module
    (import "env" "funcA" (func $funcA (result i32)))
    (import "env" "funcB" (func $funcB))
    (func $test
      (loop (result i32)
        (call $funcA)
        (i32.const 1)
        (br_if 0)
        (call $funcB)
        (loop (result i32)
          (call $funcA)
          (br 1)
        )
      )
      drop
    )
  )
  "type mismatch"
)