;; 8. **Type Mismatch in Empty Else Branch with Indirect Call**:    - Description: Create an `if-else` instruction with an expected result type of `i64`. Leave the `else` branch empty but place an indirect call in the `if` branch that returns `i32`. The type mismatch should trigger an error.

(assert_invalid
  (module
    (func $f (result i32))
    (type $sig (func (result i32)))
    (table funcref (elem $f))
    (func $type-mismatch-empty-else
      (i32.const 0)
      (if (result i64)
        (then
          (call_indirect (type $sig) (i32.const 0))
        )
        (else
        )
      )
    )
  )
  "type mismatch"
)