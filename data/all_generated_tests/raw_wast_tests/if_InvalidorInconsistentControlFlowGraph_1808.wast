;; 9. **Test Name**: Nested `if` Blocks with Conflicting Labels    **Description**: Implement nested `if` blocks where each `if` block introduces labels that conflict with each other.    **Constraints Checked**: Validity and uniqueness of nested labels.    **CFG Issue**: Checks proper label handling and context isolation within the CFG.

(assert_invalid
  (module (func $nested-if-conflicting-labels
    (if (result i32) (i32.const 1)
      (then 
        (if (result i32) (i32.const 1) 
          (then (br 1)) 
          (else (i32.const 2))
        )
      )
      (else (i32.const 3))
    )
  ))
  "invalid label"
)