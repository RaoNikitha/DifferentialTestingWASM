;; 7. **Test Description:**    - Export a function from a module that returns multiple values. Use `call_indirect` to call this function in another module, checking for correct stack operations and return value placement.    - **Constraint:** Validate multiple return value handling and stack operation conformances.    - **Context:** Ensures correct return value handling and stack operations across module boundaries.    -

(assert_invalid
  (module
    (type (func (result i32 i64)))
    (table 1 funcref)
    (func $multi-return (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)