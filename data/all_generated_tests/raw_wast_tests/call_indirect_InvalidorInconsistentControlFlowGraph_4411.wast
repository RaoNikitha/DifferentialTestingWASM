;; **Test 10**: Develop a complicated WASM module that involves recursive functions called indirectly with deliberate type mismatches in one of the recursion paths. This will test if recursive CFG structures are correctly handled and if differential implementation results in mismatched or corrupted stack frames.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32) (result i32 i32)))
    (table 2 funcref)
    (elem (i32.const 0) $func_a $func_b)
    (func $func_a (type 0) (param i32) (result i32)
      local.get 0
      i32.const 1
      i32.add
      local.get 0
      call_indirect (type 1) (i32.const 1)
    )
    (func $func_b (type 1) (param i32) (result i32 i32)
      local.get 0
      local.get 0
    )
    (func (export "test") (param i32) (result i32)
      local.get 0
      call_indirect (type 0) (i32.const 0)
    )
  )
  "type mismatch"
)