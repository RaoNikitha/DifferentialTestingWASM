;; Write a function that is supposed to return a value but instead calls another function which itself performs an invalid operation (like division by zero). Observe how WebAssembly and wizard_engine handle this nested invalid operation within a function call.

(assert_invalid
  (module
    (func $invalid-operation
      i32.const 1
      i32.const 0
      i32.div_s
    )
    (func $test-call-invalid
      (call $invalid-operation)
    )
  )
  "integer divide by zero"
)