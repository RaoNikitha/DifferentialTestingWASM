;; 1. **Test Description**:    Define a function that uses an index at the boundary of the valid range and call it within an infinite loop. Verify how the function index lookup is managed, and expect the loop to exit correctly if the index is valid.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $call-boundary (param i32) (loop (call 1) (br 1)))
  )
  "type mismatch"
)