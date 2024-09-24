;; 2. **Test Case 2: `nop` within a conditional block before `unreachable`:**    - **Constraint Checked:** Proper handling of `nop` inside control structures like `if`.    - **Expected Behavior:** If the condition is true, the block should execute `nop` then `unreachable`, causing a trap.    - **Differential Behavior:** wizard_engine might improperly execute inside conditional blocks due to mismanaged initialization.

(assert_invalid
  (module
    (func $test (param i32)
      (if (i32.eqz (local.get 0))
        (then
          (nop)
          (unreachable)
        )
      )
    )
  )
  "unreachable executed"
)