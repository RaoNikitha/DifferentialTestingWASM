;; 4. **Incorrect Result Type in Nested Loop**: Nest a loop within another loop where the inner loop specifies an incorrect return type that doesn't match the outer loop's expected type. This will test the propagation and enforcement of expected result types across nested control blocks.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result f64) (i32.const 0) (drop))
      )
    )
  )
  "type mismatch"
)