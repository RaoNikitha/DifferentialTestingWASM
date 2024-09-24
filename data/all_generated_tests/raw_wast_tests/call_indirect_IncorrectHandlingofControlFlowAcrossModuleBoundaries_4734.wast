;; Create a WebAssembly module that imports a function from another module. The imported function itself calls another function within the same module using `call_indirect`. Ensure that the correct results are pushed onto the operand stack at the end of the call chain in both implementations.

(assert_invalid
  (module
    (import "env" "external_func" (func (param i32)))
    (type $func_type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $local_func)
    (func $local_func (param i32)
      (call_indirect (type $func_type) (i32.const 0))
    )
    (func $main_func (param i32)
      (call (import "env" "external_func") (i32.const 0))
    )
  )
  "type mismatch"
)