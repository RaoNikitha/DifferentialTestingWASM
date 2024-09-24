;; 9. **Function Calls within Exception Blocks**:    Define functions that include exception handling blocks, and within these blocks, call other functions that subsequently return. Verify that stack unwinding correctly recovers from exceptions and matches the return type expected.

(assert_invalid
  (module
    (func $type-value-try-catch-call-return (result i32)
      (try (result i32) (do
        (i32.const 0)
        (call 1)
        (return)
      ) (catch_all
        (return)
      ))
    )
    (func (result i32) (i32.const 1))
  )
  "type mismatch"
)