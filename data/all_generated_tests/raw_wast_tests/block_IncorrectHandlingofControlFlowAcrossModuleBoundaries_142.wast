;; 3. **Test Description**: Utilize a `block` that performs a `call_indirect` to an exported function, within which a `block` ends with a stack type mismatch.    **Constraint**: Ensure type consistency and stack handling when using indirect calls across module boundaries.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $foo)
    (func $foo (result i32)
      (block (result i32)
        (call_indirect (type $sig) (i32.const 0))
        (i32.const 1)
      )
    )
    (func (export "test") (result i32)
      (block (result i32)
        (call $foo)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)