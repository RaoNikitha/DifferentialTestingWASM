;; Test 4: Employ loop with `return` within, and an `unreachable` following the loop. Reason: Tests the correct `return` operation when a loop unwinds and an unreachable path is reached.

(assert_invalid
  (module
    (func $loop-return-unreachable
      (loop (return))
      unreachable)
  )
  "type mismatch"
)