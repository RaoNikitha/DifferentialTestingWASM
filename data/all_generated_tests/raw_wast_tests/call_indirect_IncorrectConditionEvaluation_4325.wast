;; 4. **Test 4**: Use a `call_indirect` instruction with an incorrectly formatted `funcref` type in the table. Craft the test to ensure that the table’s type does not conform strictly to the expected type, checking whether OCaml interprets and traps correctly compared to Java.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) (ref.func 0))
    (func (type 0) (local i32)
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)