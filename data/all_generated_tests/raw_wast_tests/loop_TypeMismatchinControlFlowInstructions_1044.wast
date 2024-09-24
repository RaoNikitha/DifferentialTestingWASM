;; Test 5: A nested `loop` with an outer loop producing `[] -> [i32]` and an inner loop producing `[] -> [f64]`. Upon exiting the inner loop, the result type expected by the outer loop is not matched, which stresses the stack type validation across nested control flow instructions.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result f64)
        )
      )
    )
  )
  "type mismatch"
)