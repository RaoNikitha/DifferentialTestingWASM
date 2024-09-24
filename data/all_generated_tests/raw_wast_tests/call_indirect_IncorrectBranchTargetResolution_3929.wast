;; 8. Call a function indirectly that dynamically checks the branch target within its execution, and the label is defined incorrectly. This shows whether both implementations correctly handle dynamic label checking under functional type validation.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) func 0)
    (func (param i32) (block (br 0)))
    (func (result i32)
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type mismatch"
)