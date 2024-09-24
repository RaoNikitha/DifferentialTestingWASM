;; 9. **Large Table with Edge Boundary Access Test**:    - **Description**: Utilize a large table where `call_indirect` accesses edge indices near the boundary and just out of bounds.    - **Constraint**: Tests correct boundary handling with large tables.    - **CFG Relation**: Ensures CFG appropriately represents edge accesses and traps for out-of-bounds indices.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $largeTableFunc (param i32) (result i32)
      (local.get 0)
    )
    (table funcref (elem $largeTableFunc))
    ;; Populate table with 10000 elements, last valid index is 9999
    (func $edgeBoundaryAccess
      ;; Valid access at index 9999
      (call_indirect (type 0) (i32.const 9999))
      ;; Invalid access just out of bounds at index 10000
      (call_indirect (type 0) (i32.const 10000))
    )
  )
  "index out of bounds"
)