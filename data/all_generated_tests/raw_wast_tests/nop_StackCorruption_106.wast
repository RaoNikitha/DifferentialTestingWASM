;; 7. Design a test where `nop` instructions are placed before and after `call` instructions, calling functions that manipulate the stack. Ensure that all function calls return expected stack states without corruption.

(assert_invalid
  (module
    (func $manipulate_stack (param i32) (result i32)
      (local.get 0)
      (i32.add (i32.const 1))
      (nop)
    )
    (func (call $manipulate_stack (i32.const 0)) (nop))
  )
  "type mismatch"
)