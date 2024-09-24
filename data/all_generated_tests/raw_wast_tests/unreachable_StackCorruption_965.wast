;; 6. **Test Description:**    - **Scenario:** Insert `unreachable` within a nested block structure where different blocks push and pop values.    - **Specific Constraint Checked:** Checks that execution halts immediately at `unreachable`, without intermediary stack manipulations by nested contexts.    - **Relation to Stack Corruption:** Confirms nested blocks do not corrupt the stack beyond the trap point.

(assert_invalid
  (module (func (block (block (unreachable) (i32.const 1))) (i32.const 2) (i32.add)))
  "type mismatch"
)