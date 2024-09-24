;; 8. **Test Description:**    - **Scenario:** Place `unreachable` instruction at varying stack depths within an indirect function call table.    - **Specific Constraint Checked:** Ensures traps trigger immediately, bypassing any stack manipulations introduced by indirect calls.    - **Relation to Stack Corruption:** Validates proper handling of function stack state during indirect call traps.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 0) $func1)
    (func $func1 (result i32) (unreachable) (i32.const 42))
    (func (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)