;; Define a WebAssembly module where an exported function uses `call_indirect` to call a series of imported functions from different modules. Each function should return a different value type (e.g., i32, f32). Test the handling of these value types on the operand stack across function calls in both implementations.

(assert_invalid
  (module
    (import "moduleA" "funcA" (func $funcA (result i32)))
    (import "moduleB" "funcB" (func $funcB (result f32)))
    (table 2 funcref)
    (elem (i32.const 0) $funcA $funcB)
    (type $i32Func (func (result i32)))
    (type $f32Func (func (result f32)))
    (func $testFunc (result f32)
      (if (result f32)
        (i32.const 1)
        (call_indirect (type $f32Func) (i32.const 0))
        (call_indirect (type $f32Func) (i32.const 1))
      )
    )
    (export "testFunc" (func $testFunc))
  )
  "type mismatch"
)