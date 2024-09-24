;; 2. **Excess Argument Handling**:    - Perform a `call_indirect` where the function in the table expects fewer arguments than what is provided by the caller. This should detect stack corruption by having surplus arguments left on the stack.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table funcref (elem 0))
    (func $type-excess-args (i32.eqz (call_indirect (type 0) (i32.const 0) (i32.const 1) (i32.const 2))))
  )
  "excess arguments"
)