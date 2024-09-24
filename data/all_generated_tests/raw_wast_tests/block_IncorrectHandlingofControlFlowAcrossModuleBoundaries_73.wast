;; 4. **Nested Block with Import and Export Functions**:    - Use a block instruction that calls an imported function, then within another nested block call an exported function. This checks the handling of control flow particularly the preserving of the control flow context across module boundaries.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $inner
      (export "inner_func")
      (result i32)
      (i32.const 42))
    (func $test
      (result i32)
      (block (result i32)
        (call $external_func)
        (block (result i32)
          (call $inner)
          (br 1))))
  )
  "type mismatch"
)