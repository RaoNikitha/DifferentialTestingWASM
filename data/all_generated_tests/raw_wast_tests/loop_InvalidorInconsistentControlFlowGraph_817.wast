;; 8. **Nested Loop with Incorrect Stack Management**:    Design a nested loop structure where the inner loop disrupts the expected operand stack state before a branch to the outer loop.    Constraint: Verify correct stack management across nested loop structures and branches.    Expected: Error detection related to stack state mismanagement, preserving CFG accuracy.

(assert_invalid
  (module (func $nested-loop-stack-mismanagement
    (loop (result i32)
      (loop (result i32)
        (drop)   ;; Alters expected stack state
        (br 1)   ;; Branch to outer loop
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)