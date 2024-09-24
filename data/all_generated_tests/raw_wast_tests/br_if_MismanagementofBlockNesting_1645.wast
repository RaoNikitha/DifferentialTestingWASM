;; 6. **Test 6: Forward Branch within Nested Blocks**    - **Description:** Two consecutive blocks where the first block contains a `br_if` that conditionally jumps to the end of the second block.    - **Constraint Checked:** Proper forward jumping and stack management past multiple nested blocks.    - **Mismanagement Relation:** Verifying accurate target resolution and stack state upon a forward jump.

(assert_invalid
  (module
    (func (block
      (block
        (block
          (br_if 2 (i32.const 1))
        )
      )
    ))
  )
  "type mismatch"
)