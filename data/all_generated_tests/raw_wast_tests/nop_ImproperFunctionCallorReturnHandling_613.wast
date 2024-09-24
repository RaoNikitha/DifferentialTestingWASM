;; 4. **Test Description 4**:    - **Scenario**: Place a `nop` instruction before a `call_indirect` in a function that calls another function via a table.    - **Constraint Check**: The `nop` should not modify the operand stack affecting the indirect function call.    - **Relation to Improper Handling**: Validates that indirect calls remain precise despite the presence of `nop`.

(assert_invalid
  (module
    (table 1 funcref)
    (func $callee (result i32) (i32.const 42))
    (func $caller
      nop 
      (call_indirect (type $callee) (i32.const 0)))
  )
  "type mismatch"
)