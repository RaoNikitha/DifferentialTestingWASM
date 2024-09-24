;; 3. **Empty Table Test**:    - **Description**: Use `call_indirect` on an empty function table, ensuring it traps due to the absence of any functions.    - **Constraint**: Test the handling of tables with no elements.    - **Unreachable Code**: A trap will prevent the subsequent execution of an 'unreachable' instruction.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $empty-table (call_indirect (type 0) (i32.const 0)))
  )
  "index out of bounds"
)