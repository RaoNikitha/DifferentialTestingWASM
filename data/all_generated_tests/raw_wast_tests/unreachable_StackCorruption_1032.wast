;; 3. Test Description: Construct a loop containing `unreachable` with other stack-affecting instructions such as `i32.const` and `i32.mul` to check if looping constructs handle the immediate trapping correctly without stack corruption.

(assert_invalid
  (module 
    (func (loop 
      (i32.const 1) 
      (i32.const 2) 
      (i32.mul) 
      (unreachable) 
      (br 0))))
  "type mismatch"
)