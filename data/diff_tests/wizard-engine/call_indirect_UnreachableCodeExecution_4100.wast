;; 9. **Test: Invalid Table Type Reference Check**    - Description: Create a table with non-`funcref` type references and invoke its function indirectly. The mismatch should cause a `trap` resulting in execution reaching `unreachable`.    - Constraint: Table element must be of type `funcref`.    - Unreachable Execution: Type inconsistencies direct flow to `unreachable`.

(assert_invalid
  (module
    (type (func))
    (table 1 externref)
    (func $invalid-table-type
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "table element type mismatch"
)