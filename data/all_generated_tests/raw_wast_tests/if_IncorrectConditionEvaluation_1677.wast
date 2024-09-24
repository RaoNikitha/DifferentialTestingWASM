;; - **Test Description 8**: Use an `if` condition with a computation involving floats, cast to `i32` that results in zero (e.g., `f32.const 0.0`, `i32.trunc_f32_s`). Validate that the `else` branch executes given that the cast computes to zero.

(assert_invalid
  (module
    (func $type-condition-float-cast
      (if (i32.trunc_f32_s (f32.const 0.0))
        (then (i32.const 1))
        (else (i32.const 0))
      ) (drop)
    )
  )
  "type mismatch"
)