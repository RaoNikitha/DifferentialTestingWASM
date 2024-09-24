;; 3. **Test 3:** Embed `unreachable` within nested loops, where the outer loop should trap and the inner should not.    - **Constraint:** Ensure that `unreachable` within an inner loop leads to trapping the outer loop.    - **Relation to Infinite Loops:** Evaluates correct behavior of nested loops and avoids infinite running cycles.

(assert_invalid
  (module (func $nested-loops-unreachable
    (loop 
      (loop
        (unreachable)
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)