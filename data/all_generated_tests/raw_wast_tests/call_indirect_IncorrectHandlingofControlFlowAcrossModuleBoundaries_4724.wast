;; 3. Trigger `call_indirect` to a function in another module with an out-of-bounds table index to observe if the implementation correctly handles this case by trapping the error, properly isolating module boundaries.

(assert_invalid
  (module
    (import "external" "table" (table 1 funcref))
    (type $sig (func (param i32) (result i32)))
    (func (result i32)
      (call_indirect (type $sig) (i32.const 10))
    )
  )
  "index out of bounds"
)