;; 3. **Test Incorrect Argument Types**:    - Invoke a function with mismatched argument types (e.g., calling a function expecting integers with floating-point arguments).    - **Constraint**: Strict type checking for function arguments.    - **Improper Call Handling**: Misinterpretation of argument types could cause erroneous function execution or unexpected traps.

(assert_invalid
  (module
    (func $incorrect-arg-types (call 1 (f32.const 1.0)))
    (func (param i32))
  )
  "type mismatch"
)