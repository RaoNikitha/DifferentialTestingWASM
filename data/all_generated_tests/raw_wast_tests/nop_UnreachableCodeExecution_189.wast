;; 10. Test Description: Use `nop` in a function that is called in sequence just before the function containing an `unreachable`. Ensure that any errors in `nop` handling do not propagate and affect proper trapping in the subsequent function.

(assert_invalid
  (module 
    (func $nop_func (nop))
    (func $unreachable_func (unreachable))
    (start $nop_func))
  "starts with invalid type")