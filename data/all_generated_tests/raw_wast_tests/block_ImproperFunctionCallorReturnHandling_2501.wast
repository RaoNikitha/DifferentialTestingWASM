;; 2. Test Description: Define a block that calls an indirect function using `call_indirect`. The function table is set up with a mismatching function signature. WebAssembly should check table entries’ type and raise an error, while `wizard_engine` might proceed with an invalid call, leading to execution of an unintended function.

(assert_invalid
  (module
    (type $sig (func (param i32) (result f32)))
    (type $wrong_sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $target (type $wrong_sig) (i32.const 0))
    (func (result f32)
      (block (result f32)
        (call_indirect (type $sig) (i32.const 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)