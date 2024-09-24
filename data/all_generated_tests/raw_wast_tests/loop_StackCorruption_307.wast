;; 8. **Zero-Iteration Loop**: Create a loop designed to exit immediately by manipulating loop counters, resulting in zero effective iterations. Testing this can reveal improper initialization or premature stack unwinding in `Wizard Engine`.

(assert_invalid
  (module
    (func $zero_iteration_loop
      (i32.const 0)
      (loop (result i32)
        (br_if 1 (i32.const 1))
        (i32.const 2)
      )
      (drop)
    )
  )
  "type mismatch"
)