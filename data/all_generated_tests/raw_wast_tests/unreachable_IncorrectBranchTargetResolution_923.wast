;; 4. **Test Description:** Include `unreachable` preceding a `br_if` that conditionally jumps to an outer loop, and validate the correct execution path based on the branch condition.    *Constraint Checked:* Conditional branch handling within nested structures.    *Relation to Incorrect Branch Target Resolution:* Ensures conditional branches resolve correctly, unaffected by previous unconditional traps.

(assert_invalid
  (module (func $test-nested-conditional-loop
    (block (loop (br_if 1 (i32.const 1)) (unreachable)))
  ))
  "type mismatch"
)