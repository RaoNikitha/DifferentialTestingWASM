;; 3. **Test 3**:    - **Description**: A deeply nested structure involving a combination of blocks, loops, and conditional branches, with a call to a function that causes an early return.    - **Constraint Checked**: Checks if the implementations correctly manage control flow and stack unwinding.    - **Relation to Block Nesting**: Ensures nested calls and early returns within deeply nested blocks are managed properly.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (loop (result i32)
          (if (result i32)
            (i32.const 1)
            (then
              (call $func-with-early-return)
              (return (i32.const 0))
            )
            (else
              (i32.const 2)
            )
          )
        )
      )
    )
    (func $func-with-early-return (result i32)
      (return (i32.const 99))
    )
  )
  "type mismatch"
)