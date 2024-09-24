;; 1. **Boundary Index Testing**:    Ensure that the `br_table` instruction correctly traps when the index provided is exactly equal to the number of branch targets, testing boundary conditions.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $boundary-index-test (call_indirect (type 0) (i32.const 0) (i32.const 0)))
  )
  "index out of bounds"
)