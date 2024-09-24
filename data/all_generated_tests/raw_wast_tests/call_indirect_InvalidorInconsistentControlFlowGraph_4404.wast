;; **Test 3**: Generate a WASM module with a `call_indirect` that references a type index which is not a function type. Evaluate how both implementations handle the trap condition and demonstrate how inconsistency in type checking can lead to unreachable code in the CFG due to an unintended trap.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func)) ;; Non-function type
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type index not a function type"
)