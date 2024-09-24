;; 8. **Test 8**: Test calls a function that returns `[f64]` from within a loop expecting an `[i64]` return type. This assesses the implementation's ability to enforce return type constraints within loop constructs.

(assert_invalid
  (module
    (func $loop-type-mismatch
      (loop (result i64)
        (call 1)
        (br 0)
      )
    )
    (func (result f64))
  )
  "type mismatch"
)