;; 8. **Test: Recursive Indirect Calls Across Modules**    - Description: A module imports a function that indirectly calls back into the importing module. This verifies proper control flow and stack state management during recursive calls.    - Constraint Checked: Dynamic type checking and table indexing for indirect calls.    - Related to Control Flow: Ensures correct handling of recursive control flows across module boundaries.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32)))
    (import "mod" "func" (func $importedFunc (type 1)))
    (func $callback (type 0) (param i32) (result i32)
      call $importedFunc
      (call_indirect (type 0) (i32.const 0) (local.get 0))
    )
    (table 1 funcref)
  )
  "type mismatch"
)