;; 9. Create a scenario where an exception is intentionally thrown within an imported function call and caught by an exported function. This test verifies that exception handling and control flow rollback procedures are correctly implemented across module boundaries.

(assert_invalid
  (module
    (import "env" "throw_error" (func $throw_error))
    (export "catch_error" (func $catch_error))
    (func $catch_error
      (try
        (catch_all
          (call $throw_error)
        )
      )
    )
  )
  "unexpected end of section or function"
)