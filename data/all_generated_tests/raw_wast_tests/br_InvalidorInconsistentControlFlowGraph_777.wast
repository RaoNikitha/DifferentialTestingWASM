;; 8. **Immediate Block Termination by Nested Branch:**    - Construct a module with a nested branch that prematurely exits an outer block, followed by code that would otherwise execute.    - Reasoning: Ensures branches correctly alter flow and terminate blocks as expected.    - Relation to CFG: Premature exits need correct handling to avoid leaving unreachable code in the CFG.

(assert_invalid
  (module (func $immediate-block-termination-by-nested-branch
    (block (block (block
      (br 2)
      (i32.const 1) (drop)
    ))
    (i32.const 2) (drop))
  ))
  "unreachable code"
)