(assert_malformed
  (module
    (type $0 (func))
    (type $1 (func (result i32)))
    (table $0 1 funcref)
    (func $0 (type 1) (i32.const 42))
    (func $1 (type 1) (nop) (i32.const 0) (call_indirect 0 (type 0)))
    (export "test" (func 1))
    (elem $0 (i32.const 0) func 0)
  )
""
)