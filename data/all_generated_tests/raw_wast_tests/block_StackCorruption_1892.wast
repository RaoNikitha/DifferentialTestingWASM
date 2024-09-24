;; 3. **Test Description**: Create a block with a label that is immediately branched (`br 0`) within multiple nested blocks. This tests whether the early branching respects the stack configuration before any inner processing and does not corrupt the stack.

(assert_invalid
  (module
    (func $nested-block-branch (result i32)
      (block $outer (result i32)
        (block $inner
          (br $outer (i32.const 42))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)