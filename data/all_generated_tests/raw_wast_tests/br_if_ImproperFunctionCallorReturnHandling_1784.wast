;; 5. **Test 5: Early Stack Unwinding on Function Failure**: Simulate a failing function (e.g., one that traps) causing rapid stack unwinding, followed by `br_if` to check label access consistency post trap. This method tests if `wizard_engine` handles out-of-bounds labels effectively during abnormal function termination.

(assert_invalid
  (module
    (func $test-trap-and-br_if
      (block (result i32)
        (i32.const 1)
        (i32.const 0)
        (if (result i32) (then (i32.div_u (i32.const 1) (i32.const 0))))
        (br_if 0 (i32.const 1))
      )
    )
  )
  "unreachable code"
)