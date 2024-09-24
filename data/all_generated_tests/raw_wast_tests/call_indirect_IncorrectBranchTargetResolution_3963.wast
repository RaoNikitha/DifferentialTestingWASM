;; 2. **Test Description**: Create a function table with valid function types but perform `call_indirect` using an index that exceeds the table bounds. Verify the implementation correctly branches to the out-of-bounds error handler.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 2 funcref)
    (func $out_of_bounds (call_indirect (type 0) (i32.const 10)))
  )
  "out of bounds table access"
)