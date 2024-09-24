;; 8. **Test Case: Forward vs Backward Label Branching**    - **Test Description**: Construct a scenario where `br` and `br_if` instructions both forward and backward within the nested blocks. Ensure that control transitions smoothly without misinterpretation of labels.    - **Constraint**: Confirms label stack management handles both inward (forward branches) and outward (backward branches) correctly.    - **Relation to Mismanagement**: Failure in backward label resolution will cause jumps to incorrect blocks, breaking control flow.

(assert_invalid
  (module
    (func $forward-backward-branch (result i32)
      (block (result i32)
        (i32.const 1)
        (block
          (br 1) ; jumps to the outer block
          (i32.const 2)
        )
        (i32.add)
        (br_if 0 (i32.const 0)) ; conditionally jumps to the end of the outer block
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)