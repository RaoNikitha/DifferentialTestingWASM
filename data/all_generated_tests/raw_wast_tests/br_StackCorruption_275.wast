;; 6. **Test for Resume Execution Post-`end` Instruction:**    - Create nested `block` instructions with a `br` instruction jumping to an outer block and assert that execution resumes correctly after the `end` of the targeted block with the stack in the correct state.

(assert_invalid
  (module (func $nested-br
    (block
      (block
        (br 1)
      )
      (nop)
    )
    (i32.const 0)
  ))
  "type mismatch"
)