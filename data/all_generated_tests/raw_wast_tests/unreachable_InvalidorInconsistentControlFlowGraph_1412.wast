;; 3. **Test Description:** Incorporate `unreachable` inside an `if-else` conditional, where both branches contain instructions after the `unreachable`. This tests whether the CFG correctly identifies the trap in either conditional path and halts appropriate further execution.    - **Constraint:** `unreachable` should consistently trap in both branches.    - **Relation to CFG:** Ensures consistent handling of traps in conditional paths within the CFG.

(assert_invalid
  (module (func $type-unreachable-if-else
    (if (i32.const 1)
      (then (unreachable) (i32.const 1))
      (else (unreachable) (i32.const 2))
    )
  ))
  "type mismatch"
)