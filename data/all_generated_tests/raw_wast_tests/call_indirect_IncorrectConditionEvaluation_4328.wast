;; 7. **Test 7**: Implement a `call_indirect` instruction where the table holds references to non-function elements (e.g., data). Check for conformity to the required `funcref` type and whether OCaml and Java trap consistently when non-matching types are attempted to be invoked.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 null)
    (func $ref (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)