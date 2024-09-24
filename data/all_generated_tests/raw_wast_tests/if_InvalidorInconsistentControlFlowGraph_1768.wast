;; 9. **Conditional Jump causing Inconsistent Execution Paths**:    - Test an `if` statement with a conditional jump (e.g., `br_if`) that causes an inconsistent execution path when condition evaluation leads to a break prematurely.    - *Constraint*: Proper handling of conditional jumps ensuring CFG correctness.    - *Relation to CFG*: Ensures accurate CFG generation involving conditional jumps.

(assert_invalid
  (module (func $if-with-conditional-jump
    (if (result i32) (i32.const 1)
      (then (br_if 0 (i32.const 0)) (i32.const 1))
      (else (i32.const 2))
    )
  ))
  "type mismatch"
)