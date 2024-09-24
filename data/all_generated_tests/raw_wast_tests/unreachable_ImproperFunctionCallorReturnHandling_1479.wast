;; 10. **Test 10: Function Call Before Unreachable in Loop**     - Description: Insert a function call followed by `unreachable` inside a loop.       - *Constraint:* Confirms loop iteration ceases on `unreachable` despite function calls.       - *Improper Handling Check:* Verifies proper loop control and trapping with function calls and `unreachable`.

(assert_invalid
  (module
    (func $callee (nop))
    (func $caller
      (loop
        (call $callee)
        (unreachable)
      )
    )
  )
  "type mismatch"
)