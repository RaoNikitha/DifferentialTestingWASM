;; 1. Define two WebAssembly modules, A and B. Module A exports a function that calls an imported function from Module B using `call_indirect`. The function in Module B returns an i32 value. Verify whether the value on the operand stack is correctly handled and matches the expected result across both implementations after the function call returns to Module A.

(assert_invalid
  (module
    (import "B" "func" (func $b_func (result i32)))
    (table funcref (elem $b_func))
    (type $sig (func (result i32)))
    (func $a_func
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)