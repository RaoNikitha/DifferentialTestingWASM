;; 4. **Negative Index Handling**:    Although indices should be non-negative, simulate erroneous behavior by passing a negative index and observe if the implementation traps as expected.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32) (result i32) (local.get 0))
    (func (call_indirect (type 0) (i32.const -1) (i32.const 0)))
  )
  "index out of bounds"
)