;; 10. **Test: Boundary Condition with Imported Module Context**    - Description: Calling an imported function where the table index is exactly at the boundary of the table size, ensuring no off-by-one errors in indexing.    - Constraint Checked: Boundary conditions in table indexing.    - Related to Control Flow: Verifies precise boundary checking when calling functions from imported modules.

(assert_invalid
  (module
    (import "env" "f" (func $f (param i32)))
    (type $sig (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $boundary-test
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 1))
    )
  )
  "out of bounds table index"
)