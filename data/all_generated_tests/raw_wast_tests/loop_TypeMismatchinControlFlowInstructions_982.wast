;; Test 3: A nested `loop` within another `loop` where the inner loop yields a floating-point type but the outer loop expects an integer type, causing a mismatch when branching to the outer loop.

(assert_invalid
  (module
    (func
      (loop (result i32)
        (loop (result f32)
          (f32.const 0.0)
          (br 1)
        )
        (i32.const 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)