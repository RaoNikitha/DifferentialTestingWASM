;; 5. Execute `call_indirect` in a multi-module scenario where the operand stack is not sufficiently maintained, ensuring that calls to imported functions correctly manage the stack depth and result handling.

(assert_invalid
  (module
    (table funcref (elem $f))
    (type $sig (func (param i32)))
    (import "env" "func" (func $f (param i32)))
    (func $test
      (i32.const 1)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)