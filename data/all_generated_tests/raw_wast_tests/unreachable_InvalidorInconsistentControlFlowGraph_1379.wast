;; 10. **Test Mixed Instruction Set with Unreachable:**     - Create a function mixing valid arithmetical operations and conditionals interspersed with blocks containing `unreachable`. Validate the mixture does not disrupt CFG determination for valid operations.     - **Constraint Checked:** Accuracy in handling mixed valid and trap-inducing instructions.     - **CFG Relation:** Misaligned CFG impacts could cause valid instructions to be misprocessed due to traps elsewhere in the function.

(assert_invalid
  (module (func $mixed-instructions-unreachable (result i32)
    (i32.const 10)
    (if (then (unreachable)))
    (i32.add (i32.const 1) (i32.const 2))
  ))
  "type mismatch"
)