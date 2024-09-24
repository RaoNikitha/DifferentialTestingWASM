;; 8. Implement an `if` statement where the `then` block has another `if` with an unreachable `else` part. Improper control jumping should not lead to execution of the unreachable code if nested branches are validated correctly.

(assert_invalid
  (module (func $nested-if-unreachable
    (if (i32.const 1)
      (then
        (if (i32.const 0)
          (then (i32.const 1))
          (else (unreachable))
        )
      )
    )
  ))
  "unreachable code validation"
)