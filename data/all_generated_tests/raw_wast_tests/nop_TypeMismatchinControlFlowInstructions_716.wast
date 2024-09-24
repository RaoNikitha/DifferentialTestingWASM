;; 7. **Test 7: Invalid `call_indirect` Type pre-`nop`**    - Position a `nop` after an invalid `call_indirect` instruction where the type signature is deliberately mismatched.    - **Constraint**: `nop` must not interact with `call_indirect` type validation.    - **Type Mismatch Check**: Ensures `call_indirect` correctly handles function type verification.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (table funcref (elem))
    (func (param i32) (result i32)
      (call_indirect (type $t0) (i32.const 0) (i64.const 1))
      (nop)))
  "type mismatch"
)