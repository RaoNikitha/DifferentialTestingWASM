;; Test 10: Implement an imported function that internally calls an exported function also containing an unreachable instruction. Validate correct handling of nested call boundaries and unreachable states.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (export "internal_func") (result i32)
      (call $external_func)
      (unreachable)
    )
  )
  "type mismatch"
)