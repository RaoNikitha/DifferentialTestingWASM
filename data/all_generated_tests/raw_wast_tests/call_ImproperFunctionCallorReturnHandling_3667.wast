;; 6. Perform `call_indirect` with a mismatched type compared to the function signature in the table, ensuring type checking and correct function dispatch.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $mismatched-call
      (call_indirect (type 1) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)