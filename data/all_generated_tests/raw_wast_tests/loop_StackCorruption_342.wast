;; 3. **Conditional Branch with Inconsistent Stack Manipulation**    - Design a loop with conditions (`br_if`) influenced by stack top elements. Expect differential stack handling when the condition branches are toggled in consecutive iterations.

(assert_invalid
  (module (func $cond-branch-inconsistent-stack
    (loop $start
      (i32.const 1) (br_if $start)  ;; Condition that can change stack
      (i32.const 2) (br_if $start)  ;; Another condition that can change stack
    )
  ))
  "type mismatch"
)