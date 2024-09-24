;; 8. **Indirect Function Calls with Nested Blocks**:    - **Description**: Employ indirect function calls within nested blocks, where the table entries are dynamically checked for valid function indices and types.    - **Constraint**: The nested structure must correctly validate the dynamic function indices and handle traps precisely.    - **Relation to Mismanagement of Block Nesting**: Ensures context and type validation is maintained even with dynamic function indices in nested scenarios.

(assert_invalid
  (module
    (type (func (param i32)))
    (import "env" "table" (table 1 funcref))
    (func $indirect-func
      (block (block (call_indirect (type 0) (i32.const 0))))
    )
  )
  "type mismatch"
)