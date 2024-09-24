;; Create a test with an `if` statement in which the condition derives from an `f32`, enforcing type mismatch as `if` conditions strictly require an `i32`. This ensures the implementations correctly enforce the input stack type requirement before evaluating the condition.

(assert_invalid
  (module (func $test-if-f32-condition
    (if (f32.const 1.0) (then (nop)) (else (nop)))
  ))
  "type mismatch"
)