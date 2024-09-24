;; 8. **Switch-case Return With Default Unreachable**:    - Use a switch-case structure with `return` in one case and `unreachable` in the default case. Trigger the case with `return`.    - This test ensures the switch logic correctly respects `return` and does not mistakenly flow into `unreachable`.

(assert_invalid
  (module
    (func $switch-case-return-with-default-unreachable (result i32)
      (block
        (block
          (i32.const 0)
          (br_table 1 0
            (return (i32.const 42))
            (unreachable)
          )
        )
      )
    )
  )
  "type mismatch"
)