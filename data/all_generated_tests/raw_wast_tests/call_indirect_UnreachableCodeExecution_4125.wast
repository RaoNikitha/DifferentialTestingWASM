;; 4. **Invalid Table Reference Leading to Unreachable**:    - Use an invalid table reference in `call_indirect` and ensure it immediately results in a trap and hits the `unreachable` instruction.    - Validates proper referencing and points out discrepancies in table validation before control flow hits unreachable code.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 0 funcref)
    (func $test-func (param i32) (result i32)
      (unreachable)
    )
    (func (result i32)
      (call_indirect (type $sig) (i32.const 1)) ; index 1 is invalid as table size is 0
      (i32.const 0)
    )
  )
  "type mismatch"
)