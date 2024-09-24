;; 5. **Test 5: Type Constraint Violation in Function Bodies with `nop`**    - Use a `nop` following an operand stack altering instruction in a function body which should normally produce a type mismatch.    - **Constraint**: Tests if `nop` correctly leaves the operand stack unchanged.    - **Type Mismatch Check**: Verifies function body handles stack types accurately even with `nop`.

(assert_invalid
  (module (func (param i32) (nop) (i32.add)))
  "type mismatch"
)