;; 7. **Nested Loop with Conditional Break**:     - Implement nested loops with conditional branches to break out of inner loop and place `nop` instructions in both loops. Validate the exit from inner loop correctly resumes control in outer loop.    - This checks that the combination of `nop`, loop, and conditional breaks doesn't mismanage resumption points between nested loops.

(assert_invalid
  (module
    (func (loop (block (br_if 1 (i32.const 1) (nop) (br 0)) (nop)))
          (loop (block (br_if 1 (i32.const 0) (nop) (br 0)) (nop))))
  )
  "invalid conditional break in nested loops"
)