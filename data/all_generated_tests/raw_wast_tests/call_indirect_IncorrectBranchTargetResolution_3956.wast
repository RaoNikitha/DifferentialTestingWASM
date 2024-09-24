;; 5. **Test Description 5**:    - Write a WebAssembly module where nested `call_indirect` functions rely on branches to indirectly resolve their targets through computed `br_table`. Verify if both implementations handle branches resolving through tables correctly when indirect calls are present in different branch cases.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32 i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func $func1 (type $sig1) (param i32) (result i32)
      (local.get 0)
    )
    (func $func2 (param i32 i32) (result i32)
      (block
        (br_table 0 0 (local.get 0))
        (call_indirect (type $sig2) (local.get 0))
      )
    )
    (func (export "test")
      (call_indirect (type $sig2) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)