;; 8. **Test Description**: Implement a `br_table` that directly leads to a recursive `call` sequence, causing deep recursion. This tests if the stack depth is correctly managed and if it handles stack overflow or recursion depth exceeding expected limits.

(assert_invalid
  (module
    (func $recursive-call (param i32)
      (block
        (br_table 0 (call 0 (i32.const 0)))
      )
    )
    (func $entry (call $recursive-call (i32.const 1)))
  )
  "stack overflow"
)