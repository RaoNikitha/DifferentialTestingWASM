;; 4. **Test Description:**     Test a `call_indirect` with an invalid type leading to a function that contains an `unreachable` instruction, verifying proper type checking and trap execution.    **Constraint Checked:** Type checking at `call_indirect` and ensuing correct trap behavior.    **Relation to Improper Call/Return Handling:** Ensures that `call_indirect` type mismatches correctly propagate the trap and don't result in unintended execution.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table anyfunc (elem $func))
    (func $func (param i32) (result i32)
      (unreachable)
    )
    (func (call_indirect (type $sig) (i32.const 0)))
  )
  "type mismatch"
)