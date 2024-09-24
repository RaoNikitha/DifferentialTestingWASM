;; 10. **Test for Unreachable Code Handling in `br_table` with Final `call_indirect`**:    - Use `br_table` to jump through unreachable sections leading to a valid `call_indirect`. Test how unreachable sections affect subsequent indirect calls.    - Constraint: Execution flow includes unreachable code.    - Relation: Investigates how different engines handle unreachable code sections leading to indirect calls.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $unreachable-indirect-call
      (block
        (br_table 0 (block (unreachable)))
        (call_indirect (type $sig) (i32.const 0))
      )
    )
  )
  "type mismatch"
)