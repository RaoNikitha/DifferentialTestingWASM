;; 2. **Test 2: Loop with Conditional Branch and Exported Function**:    - A loop that branches to an exported function based on a condition. The function modifies an external state.    - **Constraint Checked**: Verifies that the function call transitions maintain the correct operand stack height and control flow within the loop.    - **Relevance**: Ensures proper handling of jumping to an exported function and transitioning back to the loop.

(assert_invalid
  (module
    (func $test-loop-conditional-branch (result i32)
      (local $cond i32)
      (i32.const 1)
      (local.set $cond)
      (loop $loop_block (result i32)
        (i32.const 42)
        (local.get $cond)
        (if
          (then
            (call $external_func))
          (else
            (br $loop_block)))
      )
    )
    (func $external_func)
  )
  "type mismatch"
)