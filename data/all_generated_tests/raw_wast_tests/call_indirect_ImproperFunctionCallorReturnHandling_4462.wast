;; 1. A test where `call_indirect` is used to call a function using a table index just below its valid range, ensuring the implementation properly traps before performing a call. This test checks the implementation's handling of invalid table indices.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func (result i32) (call_indirect (type 0) (i32.const -1)))
  )
  "out of bounds"
)