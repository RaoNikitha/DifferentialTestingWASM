;; 7. **Test with Interleaved Calls and Returns**    - Implement a test with multiple function calls interleaved with return instructions having different types.    - Ensure that stack integrity is maintained across complex call-return sequences.    - Relates to stack management across nested calls, ensuring return correctly handles and restores the stack.

(assert_invalid
  (module
    (func $interleaved-calls-and-returns (result i32)
      (call $dummy) (return)
      (call $dummy) (i32.const 0)
    )
    (func $dummy)
  )
  "type mismatch"
)