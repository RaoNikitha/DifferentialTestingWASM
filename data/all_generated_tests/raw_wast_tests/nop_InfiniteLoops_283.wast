;; 4. **Test a nested `loop` where inner loop contains `nop` followed by `br_if` outer loop**:    - **Constraint**: Ensures `nop` within inner loops does not impact the break conditions of outer loops.    - **Relation to Infinite Loops**: Incorrect implementation may cause failures in breaking from nested loops, causing the program to get stuck.

(assert_invalid
  (module
    (func $nested-loop (loop $outer (loop $inner (nop) (br_if $outer (i32.const 0))))))
  "unexpected end of section or function")