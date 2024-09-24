;; 6. **Test 6: Unreachable in Function Prologue/Epilogue**    - Description: Embed `unreachable` within the prologue or epilogue of a function call.      - *Constraint:* Checks that both function setup and cleanup are bypassed by `unreachable`.      - *Improper Handling Check:* Confirms `unreachable` prevents incorrect prologue/epilogue execution.

(assert_invalid
  (module (func $test_unreachable_prologue_epilogue
    (call $dummy)
    unreachable
    (call $another_dummy)
  ))
  "type mismatch"
)