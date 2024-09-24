;; Define a proper function type but introduce a deliberate type mismatch by indexing a function that takes similar types but in different orders. Confirm if this mismatch forces an `unreachable` trap, preventing misinterpretation of the correct function signature and parameter ordering.

(assert_invalid
  (module
    (type (func (param i32 f64)))
    (type (func (param f64 i32)))
    (table 2 funcref)
    (elem (i32.const 0) 1)
    (func (type 1) end)
    (func (call_indirect (type 0) (i32.const 0) (i32.const 42) (f64.const 3.14)))
  )
  "type mismatch"
)