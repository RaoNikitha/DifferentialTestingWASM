;; 10. **Test Description**: Import a function that conditionally executes `return` from another module and export it again. Call it from a third module to see if the operand stack is managed correctly, with the correct operations and expected values maintained.

(assert_invalid
  (module
    (import "moduleA" "func" (func $imported_func))
    (func $exported_func
      (call $imported_func)
      (return)
    )
    (export "exported_func" (func $exported_func))
  )
  "type mismatch"
)