;; 7. **Test Description:**    - **Scenario:** Execute multiple nested `unreachable` instructions within block contexts with varying stack depths.    - **Specific Constraint Checked:** Ensures consistent trapping behavior and that no further stack operations occur after the first trap.    - **Relation to Stack Corruption:** Verifies that multiple traps within nested blocks do not affect stack integrity.

(assert_invalid
  (module (func $type-nested-unreachable-in-blocks
    (block
      (block
        (block
          (unreachable)
        )
        (i32.const 1)
        (drop)
      )
      (unreachable)
    )
    (i32.const 2)
    (drop)
  ))
  "type mismatch"
)