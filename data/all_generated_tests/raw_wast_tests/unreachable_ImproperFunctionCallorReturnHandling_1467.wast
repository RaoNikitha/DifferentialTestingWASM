;; 8. **Test Description:**    - A function that returns a value before reaching `unreachable` ensuring the return sequence is interrupted properly without value propagation.    - This test ensures that return handling does not propagate unintended values when `unreachable` is encountered.

(assert_invalid
  (module (func (unreachable) (return (i32.const 1)) (i32.add (unreachable))))
  "type mismatch"
)