;; 1. Test the `call_indirect` instruction with a table of mixed function types where one function has an extra branch instruction that targets a non-existent label. This checks the error handling for invalid branch targets within function types when the call index is out of bounds.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (table funcref (elem 0 1))
    (func $f1 (call_indirect (type 0) (i32.const 2)))
    (func $f2 (call_indirect (type 1) (i32.const 0)))
  )
  "type mismatch"
)