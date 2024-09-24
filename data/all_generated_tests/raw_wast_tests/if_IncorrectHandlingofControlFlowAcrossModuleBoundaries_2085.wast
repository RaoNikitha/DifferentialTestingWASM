;; 6. **Test Description:**    Design a test where an `if` block within an exported function conditionally calls another exported function from a different module. Verify that the operand stack and control flow handle the transition correctly, both when the condition is true and false, ensuring consistency in stack state and execution path across module boundaries.

(assert_invalid
  (module
    (import "module_a" "func_a" (func $func_a (result i32)))
    (func $test_func
      (if (i32.const 1)
        (then (call $func_a))
        (else (nop))
      )
    )
    (export "test_func" (func $test_func))
  )
  "type mismatch"
)