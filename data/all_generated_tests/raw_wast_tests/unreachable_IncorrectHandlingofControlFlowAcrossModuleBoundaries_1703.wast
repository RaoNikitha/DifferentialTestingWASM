;; Test 4: Embed the unreachable instruction in an exported function which is then called by an import from another module. Validate the transition handling across module call boundaries.

(assert_invalid
  (module
    (import "env" "external_function" (func $external_func))
    (func (export "test_function")
      (unreachable)
    )
    (func $call_external
      (call $test_function)
      (call $external_func)
    )
  )
  "unreachable trap"
)