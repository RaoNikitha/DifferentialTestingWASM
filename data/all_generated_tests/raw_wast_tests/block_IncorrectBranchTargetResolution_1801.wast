;; 2. **Test Nested Block Branch Out of Scope**:    - Define nested blocks and use a `br` instruction in the inner block that targets a non-enclosing block.    - This checks for proper resolution of nested block labels.    - Expected result: WebAssembly should error as the branch is out of scope, whereas wizard_engine might incorrectly resolve the target.

(assert_invalid
  (module
    (func $nested-block-branch-out 
      (block 
        (block 
          (br 2) 
        ) 
      ) 
    ) 
  ) 
  "unknown label"
)