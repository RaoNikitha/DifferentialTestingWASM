;; 8. **Zero Condition Branch**:    - Design a test with a `br_if` inside a block evaluated on a hardcoded zero value (`i32.const 0`, `br_if 0`). The expectation is no branching should occur.        Constraints: Checks if the zero constant condition correctly prevents branching despite the `br_if`.

(assert_invalid
  (module (func $zero-condition-branch
    (block (result i32) 
      (i32.const 0)
      (br_if 0 (i32.const 42))
    )
  ))
  "type mismatch"
)