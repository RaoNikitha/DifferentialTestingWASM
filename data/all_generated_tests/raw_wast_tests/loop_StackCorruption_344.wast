;; 5. **Loop with Non-Integer Operations**    - Develop test cases involving loops performing non-integer operations (e.g., floating-point arithmetic) and integrate loop-specific stack tests to ensure consistency when using `br`, `br_if`, and `br_table` with these operations.

(assert_invalid
  (module
    (func $non_integer_loop 
      (loop (result f32)
        (f32.const 0.0)
        (br 0)
      )
    )
  )
  "type mismatch"
)