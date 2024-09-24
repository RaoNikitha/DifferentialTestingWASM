;; Create an `if` block with a true condition and a branch within the `then` block leading to an `unreachable` instruction. Assess if true conditions route correctly and do not erroneously reach the unreachable code.

(assert_invalid
  (module
    (func $test-block-true-unreachable
      (if (result i32) (i32.const 1)
        (then (br 0) (unreachable))
        (else (i32.const 2))
      ) (drop)
    )
  )
  "type mismatch"
)