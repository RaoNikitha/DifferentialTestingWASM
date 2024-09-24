;; 1. **Test Description:**    - Call a function that reaches `unreachable` directly and verify if an unconditional trap halts the further execution as expected.    - This test checks if the function call properly triggers a trap and does not continue with unintended instructions.

(assert_invalid
  (module (func $test-unreachable
    (call $trigger-unreachable)
    (unreachable)
  ))
  "unknown function"
)