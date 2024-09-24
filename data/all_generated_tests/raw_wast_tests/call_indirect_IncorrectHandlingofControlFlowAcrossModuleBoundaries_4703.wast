;; 2. Testing a cross-module function call with an out-of-bounds table index should result in a trap. This checks if the table indexing respects the boundaries of the table across module boundaries.

(assert_invalid
  (module
    (type (func))
    (type (func (param i32)))
    (import "env" "table" (table 1 funcref))
    (func (import "env" "externalFunc") (param i32))
    (func $testFunc
      (call_indirect (type 1) (i32.const 2))
    )
  )
  "out of bounds table index"
)