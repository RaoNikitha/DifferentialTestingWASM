;; **Test 7**: Call a function that raises an error or trap, then catch it and make further calls. - **Constraint Checked**: Proper error handling and stack unwinding. - **Stack Corruption Risk**: Incorrect trap handling in wizard_engine could lead to an inconsistent stack state, affecting subsequent calls.

(assert_invalid
  (module
    (func $trap-func
      unreachable
    )
    (func $nested-call
      (call $trap-func)
      (call $trap-func)
    )
    (func (call $nested-call))
  )
  "unreachable executed"
)