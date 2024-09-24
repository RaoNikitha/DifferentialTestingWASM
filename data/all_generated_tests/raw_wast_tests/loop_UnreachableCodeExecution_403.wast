;; 4. **Conditional Branch to Unreachable**:    Develop a loop with a conditional branch (`br_if`) that depends on the operand stack. If the condition is met, the branch should lead to an `unreachable` instruction, testing if the branch is properly evaluated and unwinds the operand stack.

(assert_invalid
  (module (func $conditional-branch-to-unreachable
    (loop (result i32) 
      (i32.const 1) 
      (br_if 0 (i32.const 0)) 
      (unreachable)
    )
  ))
  "type mismatch"
)