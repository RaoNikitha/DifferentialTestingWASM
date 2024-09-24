;; 4. **Test 4: Sequence with Immediate `unreachable` After Stack Operations**    - Tests immediate execution of `unreachable` right after stack-manipulating operations like `push` and `pop`.    - Verifying how both implementations clear or handle the stack when an immediate trap is invoked.    - Ensures no stack underflow or residual values left on the stack.

(assert_invalid
  (module
    (func $test-stack-manipulation-unreachable
      (i32.const 42)
      (drop)
      (unreachable)
      (i32.const 1)
      (i32.add)
    )
  )
  "type mismatch"
)