;; 9. **Test for Mismatched Block Type Resolution**:    Plan a loop where the `blocktype` mismatches the expected input or output types within nested branches. The test checks if such matches correctly cause validation errors, ensuring correct block type resolution affecting branch targets.

(assert_invalid
  (module (func $mismatched-blocktype (result i32)
    (block (result i32)
      (loop (result f32) (br 0))
    )
  ))
  "type mismatch"
)