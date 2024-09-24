;; 8. **Test Description:** Create a `block` with an `unreachable` and place `br` instructions inside nested blocks within the block. Some branches should skip the unreachable.    - **Constraint Checked:** Tests branch targets within nested block structures.    - **Incorrect Branch Target Relation:** Verifies if branching skips the unreachable correctly when jumping out of nested blocks.

(assert_invalid
  (module (func $test-nested-blocks-br (result i32)
    (block (result i32)
      (block
        (unreachable)
        (block
          (br 2 (i32.const 1)) ;; Skip unreachable and all nested blocks, should expect i32.
        )
      )
    )
  ))
  "type mismatch"
)