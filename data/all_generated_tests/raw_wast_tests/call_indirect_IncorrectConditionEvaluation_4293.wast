;; 2. Test the `call_indirect` instruction with a valid table index that refers to a non-existent function, ensuring that this scenario causes a trap.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 10 funcref)
    (func (result i32)
      (call_indirect (type 0) (i32.const 11))
    )
  )
  "index out of bounds"
)