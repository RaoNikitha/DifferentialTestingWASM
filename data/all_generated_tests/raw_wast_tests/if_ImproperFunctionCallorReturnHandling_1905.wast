;; 6. **Function Call Loop within `if` Block**:    - Recursive function call within `if` that exceeds the maximum call stack depth.    - Check whether each implementation properly captures the recursion limit and handles the call stack overflow.

(assert_invalid
  (module
    (func $recursive (result i32)
      (i32.const 1)
      (if (result i32)
        (call $recursive)
        (else (i32.const 0))
      )
    )
    (start $recursive)
  )
  "call stack overflow"
)