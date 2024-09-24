;; Test 4: Embed `unreachable` inside a conditionals (`if` and `else` statements) without proper branching types. This tests if either branch is executed despite the trap.

(assert_invalid
  (module (func $conditional-unreachable-test
    (if (i32.const 1) (then (unreachable)) (else (i32.const 0)))
  ))
  "type mismatch"
)