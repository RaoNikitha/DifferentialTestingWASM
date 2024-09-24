;; **Test 8**: Invoke a function call inside a loop construct and test the use of local index constraints. Validate if incorrect evaluation conditions lead to infinite loops or early exits due to incorrect call index handling.

(assert_invalid
  (module
    (func $test-loop-call
      (loop
        (call 1)
        (br 0)
      )
    )
    (func (param i32))
  )
  "type mismatch"
)