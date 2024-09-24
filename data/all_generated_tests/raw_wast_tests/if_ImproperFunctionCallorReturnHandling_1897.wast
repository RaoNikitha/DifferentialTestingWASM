;; 8. **If Block with Nested Calls and Returns**:    Create a conditionally executed `if` statement encompassing nested function calls. Evaluate whether wrapping function calls manage and return stack heights accurately when exiting conditions.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $nested (result i32)
      (i32.const 42)
    )
    (func $test (result i32)
      (i32.const 0)
      (if (result i32)
        (then (call $nested) (return))
        (else (i32.const 1) (return))
      )
    )
  )
  "type mismatch"
)