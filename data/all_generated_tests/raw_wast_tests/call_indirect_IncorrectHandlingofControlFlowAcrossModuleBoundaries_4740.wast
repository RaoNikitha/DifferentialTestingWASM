;; Develop a WebAssembly module that exports a function invoking another exported function from the same module via `call_indirect`. Import this function into a second module and call it. Ensure that the call stack is correctly unwinded and the results are consistent in both implementations.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $exported_func)
    (func $exported_func (export "exported_func") (param i32)
      (call_indirect (type $sig) (local.get 0))
    )
    (func (export "indirect_call")
      (call_indirect (type $sig) (i32.const 1) (i32.const 0))
    )
  )
  "type mismatch"
)