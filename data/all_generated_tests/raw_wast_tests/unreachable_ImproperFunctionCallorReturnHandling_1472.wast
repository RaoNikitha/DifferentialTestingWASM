;; 3. **Test 3: Unreachable in Nested Function Calls**    - Description: Place an `unreachable` instruction within a function that calls another function.      - *Constraint:* Ensures the outer function's continuation is trapped if `unreachable` is triggered inside the inner function.      - *Improper Handling Check:* Confirms that nested function calls correctly handle control interruption.

(assert_invalid
  (module 
    (func $inner 
      (unreachable)
    )
    (func $outer
      call $inner
      (i32.const 1)
    )
  )
  "type mismatch"
)