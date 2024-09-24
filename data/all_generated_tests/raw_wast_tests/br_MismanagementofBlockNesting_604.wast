;; 5. Test Description: **Nested Loop with Intermediate Blocks**    - Implement a `loop` containing multiple nested blocks, where `br` targets intermediate blocks but within the loop. Ensure that branches respect the intermediate block and loop structure.    - Constraint: Ensures relative indexing and control flow within nested loop and block combinations.

(assert_invalid
  (module
    (func $nested_loop_with_intermediate_blocks
      (block
        (block
          (loop
            (block (br 4))
          )
        )
      )
    )
  )
  "unknown label"
)