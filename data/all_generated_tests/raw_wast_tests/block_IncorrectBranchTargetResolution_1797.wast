;; 8. **Test Description**: A `block` with a mix of `br` and `return` instructions, ensuring the labels resolve correctly for `br` and the `return` bypasses them.    **Reasoning**: Ensures branching behavior interacts correctly with return statements, and labels for `br` are accurately resolved.

(assert_invalid
  (module (func $test-mixed-br-return (result i32)
    (block (result i32)
      (block
        (return (i32.const 42))
        (br 0 (i32.const 0))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)