;; - Craft a function with a try-catch block and place a return inside the try section. Ensure that on executing the return, the function exits correctly instead of jumping to the catch or leaving an exception unhandled.

(assert_invalid
  (module
    (func (export "test-func") (result i32)
      (try (result i32)
        (do (return (i32.const 42)))
        (catch
          (drop)
        )
      )
    )
  )
  "type mismatch"
)