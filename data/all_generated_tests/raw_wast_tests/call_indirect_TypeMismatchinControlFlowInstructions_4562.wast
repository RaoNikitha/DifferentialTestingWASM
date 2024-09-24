;; 1. **Test for Invalid Table Type as Immediate:**    - Verify behavior when `call_indirect` references a table that does not have type `funcref`. Ensure that the OCaml implementation correctly traps due to type mismatch, while the Java implementation throws an error using the type-checking helper method.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 externref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)