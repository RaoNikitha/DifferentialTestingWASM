;; Test br_if that targets a loop with a correct conditional value while checking for operand stack modification to ensure the loop exits correctly.

(assert_invalid
  (module
    (func $test-br_if-loop-operand-stack
      (loop (result i32)
        (i32.const 10)
        (br_if 0 (i32.const 1))
      )
      (i32.eqz)
      (drop)
    )
  )
  "type mismatch"
)