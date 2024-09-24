;; 3. Implement a test where the dynamically resolved function from the table has fewer parameters than required, resulting in an operand stack underflow. This should cause a failure or a trap due to insufficient operands.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem (func)))
    (func $stack-underflow
      (call_indirect (type 0) (i32.const 0))
    )
  )
  "type mismatch"
)