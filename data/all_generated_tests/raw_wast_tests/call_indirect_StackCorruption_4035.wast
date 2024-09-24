;; 4. **Table Index Out of Bounds**:    - Use `call_indirect` with an index that is out of bounds of the defined table.    - Constraint Check: Verify boundary checking of the table index.    - Stack Corruption Relation: An out-of-bounds index must trap, failing which could lead to use of invalid memory locations and stack corruption.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem))
    (func $out-of-bounds-index (call_indirect (type 0) (i32.const 1)))
  )
  "element out of bounds"
)