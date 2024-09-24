;; 6. **Test Description**:    - Provide a control structure with multiple nested loops, and within the innermost loop, call `call_indirect` with an invalid table index that exceeds the table limit.    - **Constraint**: Tests boundary conditions within nested loops.    - **CFG Relation**: CFG must correctly account for nested control structures and result in a trap path for out-of-bound indices.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table funcref (elem))
    (func $type-nested-loop
      (loop (result i32)
        (loop (result i32)
          (i32.const 10)
          (call_indirect (type $sig) (i32.const 1)) ;; Out-of-bounds index
        )
      )
    )
  )
  "out of bounds table access"
)