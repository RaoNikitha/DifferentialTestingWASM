;; 5. **Test Imported Function with Conditional Return**:    - Description: Import a function with a conditional return (e.g., based on an input parameter). Call this function from an exporting module under different conditions. Validate stack consistency and correct return behavior for both true and false conditions.    - Constraint: Check that the `return` instruction correctly handles conditional branches within imported functions.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $test_imported_func (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.eqz)
        (then (call $imported_func (i32.const 0)) (return))
        (else (call $imported_func (i32.const 1)) (return))
      )
    )
  )
  "type mismatch"
)