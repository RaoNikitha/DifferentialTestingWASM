;; 4. **Test with `unreachable` directly after valid instructions:**    - Follow up a sequence of valid stack-modifying instructions with an `unreachable` to see if the stack state consistency is preserved.    - **Constraint:** Confirms stack-polymorphism is appropriately managed.    - **Related to**: Checks if opcode positioning affects control flow as expected.

(assert_invalid
  (module (func $test_unreachable_after_valid_instructions
    (i32.const 10) (i32.const 20) (i32.add) (unreachable) (i32.const 30)
  ))
  "type mismatch"
)