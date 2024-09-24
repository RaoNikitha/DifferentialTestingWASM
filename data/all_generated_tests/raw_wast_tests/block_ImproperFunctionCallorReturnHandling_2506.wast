;; 7. Test Description: Generate a case where a block includes multiple returns (`return` instructions) and deep function calls through `call_indirect`. The return types should match only at the final return instruction. WebAssembly should ensure the correct final stack state, while `wizard_engine` might fail to maintain type consistency.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func (block (type $sig) (result i32)
      (i32.const 42) 
      (return)
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
      (i32.const 99)
    ))
  )
  "type mismatch"
)