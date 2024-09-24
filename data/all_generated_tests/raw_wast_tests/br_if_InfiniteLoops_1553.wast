;; Implement a loop with a non-zero integer on the stack that should cause the br_if to exit correctly. Validate if the stack condition is managed accurately.

(assert_invalid
  (module (func $test-loop-br_if
    (loop
      (br_if 1 (i32.const 1))
      (nop)
    )
  ))
  "type mismatch"
)