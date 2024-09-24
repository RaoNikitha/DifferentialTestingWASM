;; 6. **Test Description**:    Define a recursive function where `call_indirect` is used within a loop but with an intentional type mismatch while accessing a valid table index. Ensure an `unreachable` instruction is within the loop.    - **Constraint Checked**: Recursive type conformity.    - **Relation to Unreachable Code Execution**: Type mismatch should force a trap and the loop should prevent infinite recursion reaching `unreachable`.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $f (result i32) (i32.const 42))
    (table funcref (elem $f))
    (func $recursion
      (loop
        (call_indirect (type $sig) (i32.const 0))
        unreachable
      )
    )
  )
  "type mismatch"
)