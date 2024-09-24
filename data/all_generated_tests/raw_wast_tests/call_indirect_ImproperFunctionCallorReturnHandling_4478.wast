;; 7. Design a test where `call_indirect` instruction is provided with boundary-condition indices (e.g., the highest valid index and just out-of-bound index) to check how both implementations handle errors. Ensure that OCaml traps during pattern match and Java encounters issues in signature boundary checks.

(assert_invalid
  (module
    (type (func (param i32)))
    (func $f (param i32))
    (table funcref (elem $f))
    (func $boundary-highest-valid-index
      (call_indirect (type 0) (i32.const 0) (i32.const 1))
    )
    (func $boundary-out-of-bound-index 
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "index out of bounds"
)