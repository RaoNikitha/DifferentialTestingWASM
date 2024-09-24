;; 4. **Test Name: No-Operation Following Indirect Function Call**    - **Description**: Insert a `nop` instruction immediately after a `call_indirect` instruction.    - **Constraint**: Ensure the caller’s state remains unaffected by the inclusion of `nop`.    - **Improper Handling Check**: Evaluates if `nop` introduction disrupts post-call stack or control flow.    - **Expected Behavior**: Identical return behavior and stack state preservation across both implementations.

(assert_invalid
  (module
    (table 1 funcref)
    (type $funcType (func))
    (func $caller
      (call_indirect (type $funcType) (i32.const 0))
      (nop)
    )
  )
  "type mismatch"
)