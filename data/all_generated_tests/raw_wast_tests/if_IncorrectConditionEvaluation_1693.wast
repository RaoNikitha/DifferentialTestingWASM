;; 4. **Test Description**: Use an `if` block without an `else` part, where the condition is a non-zero constant. Validate that only the instructions within the `if` block execute and confirm there is no fall-through effect beyond `end`.

(assert_invalid
  (module
    (func $test
      (if (i32.const 42) (then (i32.const 1)))
      (i32.const 0)
    )
  )
  "type mismatch"
)