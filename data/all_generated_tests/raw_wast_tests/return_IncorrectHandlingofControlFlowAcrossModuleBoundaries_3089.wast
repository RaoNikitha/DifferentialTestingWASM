;; 8. **Test Function Table Calls with Return**:    - Description: Allocate function tables that include both imported and exported functions. Call these functions via indirect calls from both modules and ensure that returns operate correctly and maintain stack integrity.    - Constraint: Validate correct handling and return behavior when using function tables with imports/exports across module boundaries.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $f (result i32) (i32.const 0))
    (table funcref (elem $f))
    (func (result i32)
      (block (result i32)
        (call_indirect (type $sig) (i32.const 0)
          (block (result i32)
            (return (call_indirect (type $sig) (i32.const 0)))
          )
        )
      )
    )
  )
  "type mismatch"
)