;; Implement a switch-case style structure, using explicit conditional (if-else) checks that eventually lead to an `unreachable` in one of the cases. Check for immediate traps without incorrect branching.

(assert_invalid
  (module (func $switch-case-style
    (if (i32.const 0)
      (then (i32.const 0))
      (else (if (i32.const 1) (then (unreachable)) (else (i32.const 1))))
    )
  ))
  "type mismatch"
)