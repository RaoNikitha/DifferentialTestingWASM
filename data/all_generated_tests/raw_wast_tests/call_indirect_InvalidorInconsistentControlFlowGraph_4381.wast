;; 10. **Empty Table Call**: Attempt to call a function through `call_indirect` from an empty table, ensuring proper trapping or error handling when no function exists to be called.    - **Constraint**: Call from an unpopulated table.    - **CFG Relation**: Tests CFG’s path handling of calls from an empty structure leading to expected traps or errors.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table $t0 0 funcref)
    (func (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0))
    )
  )
  "element segment does not fit"
)