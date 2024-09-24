;; 9. **Boundary Index Test**:    - **Description**: Use an index on the boundary of the table size to verify correct handling without out-of-bounds errors.    - **Constraint**: Ensure boundary conditions are accurately handled.    - **Unreachable Code**: This test ensures boundary conditions are respected, trapping if wrong and preventing 'unreachable' reach.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $boundary-index
      (call_indirect (type 0) 
        (i32.const 1)   ;; Index is at the boundary of the table size
      )
    )
  )
  "index out of bounds"
)