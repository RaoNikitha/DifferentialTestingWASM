;; 10. **Test: `unreachable` and Stack Type Polymorphism**     - **Goal:** Validate correct CFG and type handling in polymorphic stack contexts.     - **Description:** Create a scenario where `unreachable` is used in the middle of polymorphic stack operations. Ensure the CFG and stack type rules are maintained, and a trap is triggered instantly.     - **Constraint Checked:** CFG correctness with polymorphic stack context containing `unreachable`.

(assert_invalid
  (module (func
    (block (i32.add) (unreachable) (i32.const 1))
  ))
  "type mismatch"
)