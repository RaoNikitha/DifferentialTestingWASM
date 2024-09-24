;; 9. **`br_if` With Stack Manipulation:**    - A `br_if` with preceding stack manipulations (push/pop). Verify the condition evaluation isn't affected by stack changes.    - Constraint Checked: Integrity of condition evaluation post stack operations.    - Relation: Ensures stack operations don't affect correct condition evaluation.

(assert_invalid
  (module (func $br_if_stack_manipulation
    (block (result i32)
      (i32.const 1) 
      drop 
      (br_if 0 (i32.const 0) (i32.const 2)) 
      (i32.const 3)
    )
  ))
  "type mismatch"
)