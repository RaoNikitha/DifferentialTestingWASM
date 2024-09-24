;; 10. Create a setup where an indirect call targets an imported function that manipulates the operand stack (e.g., push/pop operations). Validate that the operand stack state is consistent and correct after the function execution across the module boundary.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (type $sig (func (param i32) (result i32)))
    (table funcref (elem $external_func))
    (func $check_stack_state
      (i32.const 42)
      (call_indirect (type $sig) (i32.const 0))
      (drop)
    )
  )
  "type mismatch"
)