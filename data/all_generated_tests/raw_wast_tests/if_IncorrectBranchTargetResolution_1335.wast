;; 6. **Mixed Blocktype Targets and `if` Condition**:    - Use multiple blocktypes within an `if` block with diverse input/output stack configurations.    - Include `br` instructions that reuse the types defined by different blocktypes.    - This test observes type propagation correctness through diverse branches.

(assert_invalid
  (module
    (func $mixed-blocktype-if
      (block (result i32)
        (i32.const 1)
        (if (result i32) (then (i32.const 1)) (else (f32.const 1.0))) (drop)
      )
    )
  )
  "type mismatch"
)