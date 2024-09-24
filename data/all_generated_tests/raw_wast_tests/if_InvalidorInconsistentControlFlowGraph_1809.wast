;; 10. **Test Name**: Multiple `if` Blocks with Mismatched Type Signature     **Description**: Define multiple `if` blocks one after another, each with a different block type signature that does not match the expected stack output of the preceding block.     **Constraints Checked**: Proper type transition and stack height adjustment between sequential blocks.     **CFG Issue**: Ensures the CFG correctly represents type transitions and stack adjustments, avoiding inconsistencies.

(assert_invalid
  (module
    (func $multiple-if-mismatch
      (block
        (if (result i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 2)))
        (if (result f32) (i32.const 1) (then (f32.const 1.0)) (else (f32.const 2.0)))
      )
    )
  )
  "type mismatch"
)