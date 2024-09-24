;; 2. **Mismatched Loop Result Type**:    Design a loop that expects a result type of `i64` but calls a function that returns `i32`. Validate whether the mismatch causes an error in the loop's stack management.

(assert_invalid
  (module
    (func $loop-mismatch (result i64)
      (loop (result i64)
        (call $function-that-returns-i32)
      )
    )
    (func $function-that-returns-i32 (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)