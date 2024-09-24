;; 5. **Test 5**:     - Description: Embed `nop` instructions within an `if-else` construct, with one path leading to `unreachable`. This identifies if the `nop` instruction disrupts the conditions leading to `unreachable`.    - Constraint: Ensuring `nop` within conditional statements does not mistakenly trigger execution of `unreachable`.

(assert_invalid
  (module
    (func $test (if (i32.const 1) (then (nop) (unreachable)) (else (nop))))
  )
  "unreachable executed"
)