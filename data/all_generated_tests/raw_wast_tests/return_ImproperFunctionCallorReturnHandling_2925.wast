;; 4. Define a function that makes an indirect call based on an index out of bounds of the function table. The test distinguishes implementations handling the function table boundary conditions.

(assert_invalid
  (module
    (table 1 funcref)
    (elem (i32.const 1) $type-value-empty-vs-num-call)
    (func (result i32)
      (call_indirect (type (func (result i32))) 
        (i32.const 1))
    )
  )
  "element segment does not fit"
)