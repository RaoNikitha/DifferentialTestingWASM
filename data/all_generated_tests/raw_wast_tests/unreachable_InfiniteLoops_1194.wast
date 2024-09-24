;; 5. **Test 5:** Inside a loop, introduce a `br` followed by `unreachable` to test if the unconditional branch prevents reaching `unreachable`.    - **Constraint:** Validate proper functioning of unconditional branching within loops.    - **Relation to Infinite Loops:** Avoids infinite loops by ensuring the unconditional branch bypasses the `unreachable` when implemented correctly.

(assert_invalid
  (module (func $test5 
    (loop 
      (br 0) 
      (unreachable)
    )
  ))
  "type mismatch"
)