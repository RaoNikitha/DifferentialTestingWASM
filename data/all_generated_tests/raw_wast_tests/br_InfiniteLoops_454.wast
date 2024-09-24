;; A sequence where a `loop` contains a nested `if` statement with a `br_if` that always fails. The test should check proper stack unwinding and correct continuation of the main loop.

(assert_invalid
  (module
    (func $test
      (loop
        (if (i32.const 0)
          (then (br_if 0 (i32.const 1))))
      )
    )
  )
  "type mismatch"
)