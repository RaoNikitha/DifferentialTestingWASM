;; 4. **Test 4: Out of Bounds Table Indexing**:    Attempt to perform a `call_indirect` with an index outside the bounds of the table. Verify that the implementations correctly handle this by trapping and preventing stack alteration or corruption.

(assert_invalid
  (module
    (type (func))
    (table 1 funcref)
    (func (call_indirect (type 0) (i32.const 2)))
  )
  "out of bounds table index"
)