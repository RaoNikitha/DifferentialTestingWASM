;; **Test 9**: Introduce a recursion scenario where a base case has a `return` and the recursive call unwinds to an `unreachable`. Proper base case handling and return should never hit `unreachable`. *Constraint Checking*: Validates recursion termination on base case without executing subsequent code.

(assert_invalid
  (module
    (func $recursive-unreachable (result i32)
      (if (i32.const 1)
        (then (return (i32.const 42)))
        (else (call $recursive-unreachable))
      )
      (unreachable)
    )
  )
  "recursion should not hit unreachable"
)