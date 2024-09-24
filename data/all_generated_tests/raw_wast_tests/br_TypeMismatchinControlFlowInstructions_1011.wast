;; Test 2: Implement a nested loop structure where the innermost loop expects an i64 type result. Use a br instruction to jump from the innermost loop to an outer loop, erroneously pushing an f64 type instead.

(assert_invalid
  (module (func $incorrect_stack_unwinding
    (block
      (loop
        (block
          (br 1 (f64.const 1.0))
        )
      )
    )
  ))
  "type mismatch"
)