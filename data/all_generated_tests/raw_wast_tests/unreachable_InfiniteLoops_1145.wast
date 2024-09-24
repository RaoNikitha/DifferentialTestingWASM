;; Test 6: Form a loop with a series of `unreachable` instructions within conditional blocks, ensuring that the loop should exit on conditions but fails due to incorrect trap handling.

(assert_invalid
  (module (func $loop-unreachable-condition
    (loop (result i32)
      (if (i32.const 0)
        (then (unreachable))
        (else (br 1))
      )
      (unreachable)
    )
  ))
  "type mismatch"
)