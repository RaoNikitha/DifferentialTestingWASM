;; 8. **Test Description:**    Implement a test using stack-based arithmetic operations before `unreachable`, followed by additional arithmetic operations. Tests the purity and consistency of stack states.    <br>**Constraint:** Ensure that all operations stop at `unreachable`, and subsequent arithmetic operations do not execute or cause stack under/overflow.

(assert_invalid
  (module (func $type-arithmetic-before-unreachable
    (i32.const 1) (i32.const 2) (i32.add) 
    (unreachable)
    (i32.const 3) (i32.mul)
  ))
  "type mismatch"
)