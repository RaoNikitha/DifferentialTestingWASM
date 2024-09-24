;; 9. A `loop` embedding a `try` block, which then calls an imported function that throws an exception caught by another loop in the original module. This tests if exception handling within the loops operates correctly across module boundaries.

(assert_invalid
  (module
    (import "env" "throw_exception" (func $throw_exception))
    (func (try (result i32)
      (do
        (i32.const 0)
        (loop (result i32)
          (call $throw_exception)
          (br 1)
        )
      )
      (catch_all
        (loop (result i32)
          (i32.const 1)
          (br 1)
        )
      )
    ))
  )
  "type mismatch"
)