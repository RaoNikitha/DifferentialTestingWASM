;; 8. Formulate a `call_indirect` within a `block` that consumes more arguments from the operand stack than available, leading to an operand stack underflow. This will ensure that operand stack handling is correctly validated.

(assert_invalid
  (module
    (type (func (param i32 f64 f64)))
    (table 0 funcref)
    (func $operand-stack-underflow
      (block 
        (call_indirect (type 0) 
          (i32.const 0) 
          (f64.const 1.0) 
        )
      )
    )
  )
  "type mismatch"
)