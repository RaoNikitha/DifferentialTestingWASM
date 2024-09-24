;; 6. **Test Description**:    - **Scenario**: Import a function and pass a reference type parameter (like a function reference); then, use `call_indirect` to invoke it.    - **Constraint**: Ensure indirect calls handle function references correctly and the control flow transitions smoothly.    - **Differential Check**: Check the consistency between WebAssembly and wizard_engine in managing references and stack operations.

(assert_invalid
  (module
    (type (func (param funcref) (result i32)))
    (import "env" "externalFunc" (func $externalFunc (param funcref) (result i32)))
    (table 1 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 0) (ref.func $externalFunc))
    )
  )
  "type mismatch"
)