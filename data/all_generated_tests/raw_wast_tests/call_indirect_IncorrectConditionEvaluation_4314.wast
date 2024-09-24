;; 3. **Empty Function Table Access**:    - Initialize an empty table and attempt to use `call_indirect`.    - The expected result is a trap due to an out-of-bounds index.    - Check if both implementations handle the trapping situation correctly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func $empty-table-access
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "undefined element"
)