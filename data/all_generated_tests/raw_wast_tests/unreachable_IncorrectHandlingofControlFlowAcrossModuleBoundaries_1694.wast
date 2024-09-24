;; 5. **Recursive Call with `unreachable` Across Modules:**    - Create two modules that recursively call each other with functions containing the `unreachable` instruction. Compare the consistency of trapping behavior across recursive calls.    - **Constraint:** Validates whether `unreachable` correctly terminates the recursion and traps consistently, preventing stack corruption.

(assert_invalid
  (module $M1
    (import "M2" "call_m1" (func $call_m2))
    (func (export "call_m2")
      (unreachable)
      (call $call_m2)
    )
  )
)
(module $M2
  (import "M1" "call_m2" (func $call_m1))
  (func (export "call_m1")
    (unreachable)
    (call $call_m1)
  )
)