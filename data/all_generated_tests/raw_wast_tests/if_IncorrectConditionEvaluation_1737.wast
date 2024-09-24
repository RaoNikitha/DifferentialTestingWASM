;; 8. **Conditional with Multiple Operands**: Develop a test where the condition evaluates based on multiple operands combined. Ensure the final condition correctly influences the `if` branching. Validate if an implementation fails to correctly combine operands for the condition, leading to erroneous branching.

(assert_invalid
  (module (func $multiple-operands-condition (result i32)
    (i32.const 2)
    (i32.const 3)
    (i32.add) ; Calculate sum of 2 and 3
    (if (result i32) 
      (then (i32.const 1)) 
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)