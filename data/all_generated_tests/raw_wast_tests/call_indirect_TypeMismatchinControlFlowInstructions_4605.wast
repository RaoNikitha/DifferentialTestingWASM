;; 4. **Test Description**:    - Inject a `call_indirect` instruction into a block scope where the function type signature for `typeidx` expects two integer parameters, but the block provides one integer and one float, expecting a trap due to operand type mismatch.    - **Constraint Being Checked**:      - Operand stack conformity at runtime to the function type indexed by `typeidx`.    - **Relation to Control Flow Instructions**:      - Ensures the correctness of stack operations within control flows and the adherence to the function signature.

(assert_invalid
  (module
    (type (func (param i32 i32)))
    (table 1 funcref)
    (func (result i32)
      (block
        (call_indirect (type 0) (i32.const 1) (f32.const 1.0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)