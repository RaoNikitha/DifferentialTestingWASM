;; 3. **Test Description**: Invoke a function that imports from another module and returns a value. Ensure the return value matches expectations, validating the correct handling of the operand stack during control flow transitions.

(assert_invalid
  (module
    (import "env" "some_func" (func $imported_func (result i32)))
    (func $caller_func (result i32)
      (call $imported_func)
      (return (return (i32.const 42)))
    )
  )
  "type mismatch"
)