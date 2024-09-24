;; 2. **Test 2**:    Design a test with two nested `block` instructions where the innermost block has a branch instruction (`br_if 1`) followed by another block. Verify that branching properly resumes execution at the correct level. This checks if conditional branching within nested blocks is managed properly.

(assert_invalid
  (module (func $nested-block-conditional-branch (result i32)
    (block (result i32)
      (block
        (block (result i32) (br_if 1 (i32.const 1)))
        (block (result i32) (i32.const 0) (br 1))
      )
    )
  ))
  "type mismatch"
)