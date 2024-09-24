;; 3. **Test: Empty Table with Imported Function**    - Description: A module with an empty function table attempts to call an imported function indirectly. This should trap since no function can be selected.    - Constraint Checked: Validity of table indexing and presence of functions.    - Related to Control Flow: Verifies the presence and proper handling of imported functions within a non-empty table.

(assert_invalid
  (module
    (table 0 funcref)
    (import "env" "func" (func $externalFunc (param i32) (result i32)))
    (func (call_indirect (type 0) (i32.const 0)))
    (type (func (param i32) (result i32)))
  )
  "element segment does not fit"
)