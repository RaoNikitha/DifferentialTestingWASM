;; 2. **Test Description:**     - Implement a loop containing an `unreachable` followed by several `nop` (no operation) instructions and then a `br` instruction unconditionally breaking the loop.    - **Constraint:** Verify that `unreachable` causes an immediate trap, interrupting before `br`.    - **Relation to Infinite Loops:** If the `unreachable` is ignored, and `br` isn't reached, it could result in an infinite loop.    - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $test_unreachable_br
    (loop (unreachable) (nop) (nop) (br 0))
  ))
  "unreachable must trap"
)