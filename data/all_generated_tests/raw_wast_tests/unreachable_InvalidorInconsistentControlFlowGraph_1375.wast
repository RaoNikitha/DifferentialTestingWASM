;; 6. **Test Multiple Unreachable in Various Blocks:**    - Use multiple instances of `unreachable` in different blocks and nested scopes within a single function. Validate that each trap is correctly isolated.    - **Constraint Checked:** Multiple traps in diverse scopes correctly handled.    - **CFG Relation:** Misinterpreted CFG may aggregate traps incorrectly, affecting control flows across blocks.

(assert_invalid
  (module
    (func $test_multiple_unreachable
      (block
        (unreachable)
      )
      (loop
        (br 0)
        (unreachable)
      )
      (if (i32.const 1)
        (then
          (unreachable)
        )
      )
      (br 0)
      (unreachable)
      (drop)
    )
  )
  "type mismatch"
)