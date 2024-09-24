;; 9. **Test Description**: Perform a `call_indirect` to a function with return types that do not match the expected types by the `select` instruction that follows.    - **Constraint**: This test checks if the `call_indirect` instruction correctly enforces type matching for dynamic function calls and the subsequent `select` instruction.    - **Type Mismatch in Control Flow**: A type mismatch in return values will cause the `select` instruction to fail in correctly processing the values.

(assert_invalid
  (module
    (type $t1 (func (param i32) (result i32)))
    (type $t2 (func (param i32) (result f32)))
    (table funcref (elem 0))
    (func (param i32)
      (call_indirect (type $t1) (local.get 0))
      (select (f32.const 0.0) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)