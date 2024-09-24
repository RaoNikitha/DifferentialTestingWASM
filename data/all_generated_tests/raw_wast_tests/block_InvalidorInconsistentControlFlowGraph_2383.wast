;; 4. **Test Description**: Implement a block that prematurely exits with a forward branch, followed by unreachable instructions.    - **Constraint**: Ensure that forward branches correctly terminate block execution and mark subsequent instructions as unreachable.    - **CFG Relation**: Tests whether the CFG accurately identifies and handles unreachable code after forward branches.

(assert_invalid
  (module (func $block-forward-branch-unreachable
    (block (result i32)
      (br 0 (i32.const 42))
      (i32.const 1)
      (unreachable)
    )
  ))
  "unreachable code"
)