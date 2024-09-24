;; 8. Design a sequence involving multiple `call` instructions interspersed with `unreachable` statements. Check that each unreachable causes a trap, preventing subsequent calls and returns within the same function.

(assert_invalid
  (module
    (func $test-call-unreachable
      (call $dummy)
      (unreachable)
      (call $dummy)
      (unreachable)
      (return)
    )
    (func $dummy)
  )
  "type mismatch"
)