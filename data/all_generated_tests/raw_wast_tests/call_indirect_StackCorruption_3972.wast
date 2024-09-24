;; 1. **Test Description**:    A `call_indirect` instruction that performs a function call with an index that is out of bounds of the table. This test checks if the implementation correctly traps and does not corrupt the stack by continuing execution erroneously.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $out-of-bounds (call_indirect (type 0) (i32.const 2)))
  )
  "out of bounds"
)