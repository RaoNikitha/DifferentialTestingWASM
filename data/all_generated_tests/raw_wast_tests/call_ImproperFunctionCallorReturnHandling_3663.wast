;; 2. Call a function with insufficient arguments on the stack and ensure an `ArityMismatch` trap is triggered. This checks for correct argument consumption and validation before execution.

(assert_invalid
  (module
    (func $insufficient-arguments (call 1 (i32.const 42)))
    (func (param i32 i32))
  )
  "type mismatch"
)