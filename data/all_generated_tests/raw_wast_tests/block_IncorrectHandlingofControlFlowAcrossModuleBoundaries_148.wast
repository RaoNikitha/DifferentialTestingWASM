;; 9. **Test Description**: Construct a `block` involving a forward branch (`br`) that targets an exported function which in turn imports another function with a mismatching signature.    **Constraint**: Assess the branch and control flow handling when transitioning through multiple module layers.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test
      (block (result i32)
        (br 0 (call $external_func (i32.const 42)))
      )
    )
    (export "test" (func $test))
  )
  "type mismatch"
)