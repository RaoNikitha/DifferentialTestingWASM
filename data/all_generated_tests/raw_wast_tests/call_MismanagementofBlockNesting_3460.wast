;; 9. **Stack Overflow with Nested Call Depth**:    - **Test Description**: Push the limit by having deeply nested blocks that repeatedly call functions up to or beyond typical stack sizes. Check if each calls and returns manage stacks correctly without overflow.    - **Constraint Checked**: Stack depth and integrity at extreme nesting.    - **Relation to Mismanagement of Block Nesting**: Ensures correct detection and handling of stack overflow scenarios in nested calls.

(assert_invalid
  (module
    (func $recursive (param i32)
      (if (i32.ne (local.get 0) (i32.const 0))
        (then
          (call $recursive (i32.sub (local.get 0) (i32.const 1)))
        )
      )
    )
    (func $start
      (call $recursive (i32.const 1000000))
    )
  )
  "stack overflow"
)