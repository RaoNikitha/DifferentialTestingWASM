;; 10. **Boundary Off-by-One Error**:    - Construct a `call_indirect` test that uses an index just out of a valid table range by one. Ensure detection of boundary errors related to stack corruption due to improper handling of the off-by-one condition.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $f (param i32) (result i32) (i32.const 42))
    (table 1 funcref (elem $f))
    (func $boundary-off-by-one-test (result i32)
      (call_indirect (type 0) (i32.const 1))
    )
  )
  "element index out of bounds"
)