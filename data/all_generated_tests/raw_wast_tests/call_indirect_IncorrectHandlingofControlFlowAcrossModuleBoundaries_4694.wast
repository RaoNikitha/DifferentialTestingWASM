;; - **Test 3**: Have a WASM module that exports a function receiving multiple arguments. Use `call_indirect` from another module to call this function with the correct number and type of arguments. Check if the control flow manages the argument transfer accurately and if both modules maintain consistency in the operand stack.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (type 0) (i32.add (local.get 0) (local.get 1)))
    (func (type 1)
      (call_indirect (type 0) (i32.const 0) (local.get 0) (local.get 1))
    )
  )
  "type mismatch"
)