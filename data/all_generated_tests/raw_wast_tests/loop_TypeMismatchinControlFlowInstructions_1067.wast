;; Test 8: Use a loop that branches (`br`) to another loop with a different expected result type. Ensure the transition between loops induces a type mismatch, testing handling of multiple loops with different type constraints.

(assert_invalid
  (module
    (func $loop-type-mismatch
      (loop (result i32)
        (i32.const 0)
        (br 1)
      )
      (loop (result f64)
        (br 0)
      )
    )
  )
  "type mismatch"
)