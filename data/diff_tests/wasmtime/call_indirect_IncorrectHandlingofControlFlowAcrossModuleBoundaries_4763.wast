;; 2. **Test for Out-of-Bounds Index in Imported Table**:    Import a table and attempt to call a function using an indirect index that exceeds the boundaries of the imported table. The test checks if the implementation correctly traps and handles boundary checks for imported tables.

(assert_invalid
  (module
    (import "env" "table" (table 10 funcref))
    (type (func))
    (func $out_of_bounds (call_indirect (type 0) (i32.const 20)))
  )
  "out of bounds table access"
)