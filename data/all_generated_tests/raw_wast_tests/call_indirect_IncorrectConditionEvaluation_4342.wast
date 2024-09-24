;; 1. Test Description 1: Define a table with only one function that has a different signature than expected by `call_indirect`. Set up a `br_if` condition that attempts to call this function indirectly based on a falsy i32 value. Check for proper trapping behavior.

(assert_invalid
  (module
    (type (func (param i64))) 
    (table 1 funcref)
    (func (type 0))
    (func $type-mismatch (block (br_if 0 (call_indirect (type 0) (i32.const 0)))))
  )
  "type mismatch"
)