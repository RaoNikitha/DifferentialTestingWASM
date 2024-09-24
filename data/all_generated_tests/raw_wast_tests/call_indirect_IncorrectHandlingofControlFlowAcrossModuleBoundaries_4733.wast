;; Define a WebAssembly module that exports a function calling another function within the same module using `call_indirect`. Subsequently re-export this function in a second module and then call it from a third module. Test for correct operand stack handling and ensure that the return value is correctly propagated across all module boundaries.

(assert_invalid
  (module
    (type $ft (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (type $ft) (param i32) (result i32)
      local.get 0
    )
    (func $g (type $ft) (param i32) (result i32)
      local.get 0
      call_indirect (type $ft) (i32.const 1)
    )
    (export "g" (func $g))
  )
  "type mismatch"
)