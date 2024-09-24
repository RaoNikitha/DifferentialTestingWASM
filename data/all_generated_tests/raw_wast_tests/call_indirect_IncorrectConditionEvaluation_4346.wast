;; 5. Test Description 5: Implement a `call_indirect` instruction with a proper table index and function type, immediately followed by a `br_if` that should prevent the call to check if the condition prevents execution correctly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (call_indirect (type 0) (i32.const 1) (i32.const 0))
      (br_if 0 (i32.const 0))
    )
  )
  "type mismatch"
)