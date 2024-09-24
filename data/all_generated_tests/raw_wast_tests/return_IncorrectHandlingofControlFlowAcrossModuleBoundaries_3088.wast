;; 7. **Test Exception Handling and Return**:    - Description: Implement an imported function that raises an exception caught by an exporting function, after which a return is performed. Validate the state of the operand stack post-exception handling and return.    - Constraint: Ensure that the `return` instruction correctly handles stack unwinding in the presence of exceptions that cross module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func (export "exported_func") (result i32)
      (try (result i32)
        (do
          (call $imported_func)
          (i32.const 1)
        )
        (catch_all
          (return)
        )
      )
    )
  )
  "type mismatch"
)