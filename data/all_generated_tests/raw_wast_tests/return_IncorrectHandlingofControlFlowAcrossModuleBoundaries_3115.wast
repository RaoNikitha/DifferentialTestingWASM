;; 4. **Asynchronous Returns Across Modules**:    - Implement asynchronous function calls where an imported function from another module handles a return after a delay. Check if the calling module can correctly handle the delayed return values and stack unwinding.

(assert_invalid
  (module
    (import "env" "async_func" (func $async_func (result i32)))
    (func $test (result i32)
      (call $async_func (return))
    )
  )
  "type mismatch"
)