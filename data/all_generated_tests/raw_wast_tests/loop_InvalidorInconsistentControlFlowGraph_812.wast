;; 3. **Mismatched Block Type and Instr Sequence**:    Construct a loop with a block type indicating specific input and output types, but the instruction sequence within the loop does not conform to these types.    Constraint: Verify that the block's input and output types strictly align with the provided block type.    Expected: Appropriate error should be raised if type conformity is violated within the loop.

(assert_invalid
  (module (func $mismatched-block-type
    (loop (param i32) (i32.const 0.0) (drop))
  ))
  "type mismatch"
)