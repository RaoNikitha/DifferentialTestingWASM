;; 2. **Branch Targeting Incorrect Stack State**:    - Create a test where a branch (`br`) inside a block incorrectly targets a label, assuming a different stack state than it should.    - This test will highlight differences in how each implementation handles stack unwinds and state match-ups when jumping to block labels.

(assert_invalid
  (module (func $branch-target-wrong-stack (result i32)
    (block (block (result i32) (br 1 (i32.const 10))) (br 0 (f32.const 1.0)))
  ))
  "type mismatch"
)