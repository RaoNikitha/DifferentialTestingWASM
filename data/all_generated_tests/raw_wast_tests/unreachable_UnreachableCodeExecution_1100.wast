;; 1. **Test Description:**    - **Scenario:** Place the `unreachable` instruction at the end of a function expected to return a value after performing calculations.    - **Constraint Checked:** Ensures that no return is made and the function traps immediately.    - **Relation to Unreachable Code Execution:** Checks if reaching the `unreachable` instruction skips any return value, causing a trap instead.

(assert_invalid
  (module (func $unreachable-end-no-return (result i32)
    (i32.const 10)
    (i32.const 20)
    (i32.add)
    (unreachable)
  ))
  "type mismatch"
)