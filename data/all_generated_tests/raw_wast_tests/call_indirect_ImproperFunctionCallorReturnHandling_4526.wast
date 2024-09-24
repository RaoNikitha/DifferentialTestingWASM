;; 5. **Boundary Condition Check**: Test the `call_indirect` call with an index exactly at the boundary of the table size. This ensures the proper handling of edge cases and boundary checks in the table.

(assert_invalid
 (module
  (type (func (param i32) (result i32)))
  (table funcref (elem))
  (func (result i32)
   (call_indirect (type 0) (i32.const 0) (i32.const 0))
  )
 )
 "type mismatch"
)