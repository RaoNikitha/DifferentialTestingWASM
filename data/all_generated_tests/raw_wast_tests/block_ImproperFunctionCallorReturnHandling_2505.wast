;; 6. Test Description: Develop a test where a block contains `call_indirect` with an invalid table index, causing a function call to an unexpected type. WebAssembly’s type-checking should catch the invalid indirect call, while `wizard_engine` might incorrectly proceed, altering stack state.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (func $f (param i32) (result i32) (i32.const 42))
    (elem (i32.const 0) $f)
    (func $test
      (block (result i32)
        (i32.const 0) 
        (call_indirect (type $sig) (i32.const 1))
      )
    )
  )
  "type mismatch"
)