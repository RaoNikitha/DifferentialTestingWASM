;; 10. **Test Description**:    Design a test with multiple nested blocks, including an `unreachable` in the innermost block and branches which potentially misroute control to this instruction. Ensure both implementations handle nested branch scenarios trapping correctly on encountering the `unreachable`.

(assert_invalid
  (module (func $nested-unreachable
    (block (result i32)
      (block
        (block
          (br 1 (i32.const 42))
          (unreachable)
        )
        (unreachable)
      )
    )
  ))
  "type mismatch"
)