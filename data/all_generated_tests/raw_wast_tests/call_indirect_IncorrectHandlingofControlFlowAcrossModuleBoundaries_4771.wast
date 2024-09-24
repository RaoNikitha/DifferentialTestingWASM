;; 10. **Test for Table Size Change on Imported Table**:    Import a table and indirectly call functions from it. Initialize the table size with a minimal limit and later grow it. Ensure indirect calls respect the new table size and still handle out-of-bounds and previously valid indices correctly across module boundaries.

(assert_invalid
  (module
    (import "env" "table" (table 1 funcref))
    (type (func (param i32) (result i32)))
    (elem (i32.const 0) $func1)
    (func $func1 (type 0) (i32.const 0))
    (func (call_indirect (type 0) (i32.const 2)))
  )
  "out of bounds"
)