;; A loop returns mixed types, alternating integer and float in each iteration, to validate strict type constraints in operand stack unwinding.

(assert_invalid
  (module
    (func $mixed-return-loop
      (result i32)
      (loop (return (i32.const 1)) (return (f32.const 2.0)))
    )
  )
  "type mismatch"
)