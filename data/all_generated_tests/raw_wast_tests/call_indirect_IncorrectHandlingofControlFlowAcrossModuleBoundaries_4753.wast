;; 2. **Test: Imported Function Boundary Index Check**    - Description: A module imports a function and places it at the end of its function table. An `call_indirect` instruction attempts to call a function using an index out of bounds of the table size. This tests the error handling and boundary check.    - Constraint Checked: Table structure and indexing, trap condition for out-of-bounds index.    - Related to Control Flow: Ensures correct trapping behavior when accessing invalid table indices across modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $ext_func (param i32)))
    (type $sig (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $ext_func)
    (func $boundary-index-check
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "out of bounds table index"
)