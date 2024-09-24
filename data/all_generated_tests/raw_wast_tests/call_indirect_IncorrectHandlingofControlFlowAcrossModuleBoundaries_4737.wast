;; Implement a WebAssembly module with an exported function that calls an imported function. The imported function contains another `call_indirect` instruction to a third function within the same imported module. Confirm that both implementations handle operand stack and return values correctly after the nested indirect call.

(assert_invalid
  (module
    (import "env" "called_func" (func $called_func (param i32) (param i32)))
    (type $sig (func (param i32) (param i32)))
    (type $sig2 (func (param i32)))
    (table funcref (elem $called_func))
    (func (export "main")
      (i32.const 0) (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
    (func (import "env" "nested_call" (type $sig2))
      (i32.const 0)
      (call_indirect (type $sig2) (i32.const 0))
    )
  )
  "type mismatch"
)