;; 9. Devise a loop where `unreachable` is part of nested, complex type-dependent control logic (`if`, `br_if`) within loop bodies. This tests consistency in type interpretation and control handling to avoid indefinite inter-loop processes.

(assert_invalid
  (module (func $complex-loop-if-unreachable
    (loop (if (i32.const 1)
             (then (br_if 0 (i32.const 0)) (unreachable))
             (else (br 1)))
    ))
  )
  "unreachable trap"
)