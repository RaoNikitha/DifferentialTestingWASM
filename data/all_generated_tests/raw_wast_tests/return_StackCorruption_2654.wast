;; 3. **Test 3: Function with Loop and Early Return**    - Implement a loop within a function where `return` exits the function before the loop completes. Push values before the loop, end loop cleanly on one path, abruptly with `return` on another.    - *Related Constraint*: Checks correct handling of operand stack with early return within loops.

(assert_invalid
  (module
    (func $loop-with-early-return (result i32)
      (i32.const 0)
      (loop (br_if 0 (i32.const 1)))
      (return (i32.const 1))
    )
  )
  "type mismatch"
)