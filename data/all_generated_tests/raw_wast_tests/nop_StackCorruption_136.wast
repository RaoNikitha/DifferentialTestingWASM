;; 7. **Test Description**:     Construct a function with alternating `nop` and arithmetic operations (e.g., addition and subtraction). Check stack integrity continuously to see if `nop` causes any inadvertent changes.    **Constraint**: Arithmetic computations should remain consistent with and without `nop`.    **Reasoning**: Verifies if interleaved `nop` instructions lead to unexpected stack changes impacting arithmetic outcomes.

(assert_invalid
  (module (func (result i32)
    (i32.const 10)
    (nop)
    (i32.const 5)
    (nop)
    (i32.add)
    (nop)
    (i32.const 3)
    (nop)
    (i32.sub)
    (nop)
    (i32.const 0)
    (select)
  ))
  "type mismatch"
)