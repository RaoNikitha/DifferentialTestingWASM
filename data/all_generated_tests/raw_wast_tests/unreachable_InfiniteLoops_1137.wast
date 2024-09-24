;; Construct a loop where an `unreachable` follows a comparison instruction that never evaluates to true, ensuring the execution does not enter an infinite loop due to the comparison failing.

(assert_invalid
  (module (func $test-loop-with-unreachable
    (loop (result i32)
      (i32.const 0)
      (i32.const 1)
      (i32.eq)
      (br_if 0)
      (unreachable)
    )
  ))
  "type mismatch"
)