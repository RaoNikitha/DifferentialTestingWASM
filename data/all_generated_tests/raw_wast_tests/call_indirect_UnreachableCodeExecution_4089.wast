;; 8. **Undefined Function Type Test**:    - **Description**: Use a function type reference in `call_indirect` that isn’t declared in the module, causing a trap due to undefined function type.    - **Constraint**: Validate that the function type index is correctly declared.    - **Unreachable Code**: This ensures trapping due to undefined type before 'unreachable' code can execute.

(assert_invalid
  (module
    (table 0 funcref)
    (func $undefined-type (call_indirect (type 99) (i32.const 0)))
  )
  "unknown type"
)