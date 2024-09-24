;; - Test where the `if` condition checks a `non-zero` value (i32.const 1) and ensure the instructions following the `if` are executed, confirming that the `true` branch is correctly executed in both interpreters.

(assert_invalid
  (module (func $test_if_true_condition_exec
    (if (result i32) (i32.const 1) (then (i32.const 0)) (else (i32.const 1) (drop))) (drop)
  ))
  "type mismatch"
)