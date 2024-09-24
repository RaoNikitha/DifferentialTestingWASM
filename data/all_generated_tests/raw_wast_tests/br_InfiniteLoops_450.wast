;; 1. Test a single `loop` with a `br_if` condition that always evaluates to false. It will verify whether the loop runs indefinitely without correctly exiting due to a mismanaged condition check.

(assert_invalid
  (module
    (func $single-loop-with-false-br_if
      (loop
        (br_if 0 (i32.const 0))
      )
    )
  )
  "infinite loop with incorrect exit condition"
)