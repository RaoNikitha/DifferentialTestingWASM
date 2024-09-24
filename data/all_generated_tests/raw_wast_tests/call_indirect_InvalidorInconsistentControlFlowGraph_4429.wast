;; 8. **Indirect Call in Exception-Handling Context Test**:    - **Description**: Embed `call_indirect` within a try-catch block and intentionally trigger an invalid table index or type mismatch.    - **Constraint**: Ensures traps within exception-handling contexts propagate correctly.    - **CFG Relation**: Validates CFG accurately represents exception paths and handling of traps within such contexts.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result i32)))
    (table 1 funcref)
    (func $catch-invalid-call-1
      (try 
        (call_indirect (type 0) (i32.const 0) (f64.const 0.0))
      catch
      )
    )
  )
  "type mismatch"
)