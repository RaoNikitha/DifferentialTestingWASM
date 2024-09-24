;; 8. **Exception Handling in Inter-Module Returns**:    - Test exception propagation by importing a function that throws an exception. Check if the calling module properly handles the exception and any necessary stack unwinding.

(assert_invalid
  (module
    (import "env" "throw_exception" (func $throw_exception (result i32)))
    (func $handle_exception (result i32)
      (try (result i32)
        (do (i32.const 0) (call $throw_exception) (return))
        (catch_all (i32.const -1) (return))
      )
    )
  )
  "type mismatch"
)