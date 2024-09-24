;; 1. **Out-of-Bounds Table Index Check**:    Test an invalid `call_indirect` with an out-of-bounds table index. Ensure that the table lookup results in a trap rather than executing a function. This will verify the correct handling of invalid table indices in both implementations.      **Constraint**: Verify proper boundary checking for the table index in different implementations.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (func $test (call_indirect (type 0) (i32.const 1)))
  )
  "out of bounds table index"
)