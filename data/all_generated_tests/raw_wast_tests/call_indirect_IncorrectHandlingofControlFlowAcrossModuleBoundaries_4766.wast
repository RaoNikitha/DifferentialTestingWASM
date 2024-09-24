;; 5. **Test for Uninitialized Table Entry Access in Imported Table**:    Import a table and attempt to call an indirect function with an index pointing to an uninitialized table entry. This scenario should result in a trap. The test checks if the implementation properly differentiates between initialized and uninitialized table entries in imported tables.

(assert_invalid
  (module
    (import "env" "table" (table 2 funcref))
    (type $type (func (param i32) (result i32)))
    (func $uninitialized-table-call (call_indirect (type $type) (i32.const 1) (i32.const 42)))
  )
  "uninitialized table entry"
)