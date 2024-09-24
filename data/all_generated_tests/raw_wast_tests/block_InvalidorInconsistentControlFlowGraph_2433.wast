;; 4. **Test for Incorrect Result Stack Type**:    - Inside the block, perform operations that produce a different type of result compared to the declared `blocktype`. This ensures the implementation accurately handles type compliance.    - Constraint: Result type compliance.    - CFG Impact: Mismatch in the expected stack state, leading to invalid CFG.

(assert_invalid
  (module (func $test-different-result-type (result i32)
    (block (result i32) (f32.const 1.0) (i32.const 1))
  ))
  "type mismatch"
)