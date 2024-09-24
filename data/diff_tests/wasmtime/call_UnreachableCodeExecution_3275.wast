;; 4. **Test Call to Uninitialized Import**:    Define a function imported from another module but then invoke it directly without proper initialization. This checks if the engine can catch this error or if it continues executing to an `unreachable` path.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (call $external_func))
  )
  "function not initialized"
)