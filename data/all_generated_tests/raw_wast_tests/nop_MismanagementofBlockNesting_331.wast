;; 2. **Test with Loops in Nested Blocks**:    - Create a sequence of nested blocks with inner loops containing `nop` instructions. Use a branch instruction to exit the loop and ensure control flow properly returns to the outer block.    - This test ensures that `nop` within loops nested inside blocks does not affect the proper control flow upon exiting the loop.

(assert_invalid
  (module
    (func $nested_blocks_with_loop
      (block $outer_block
        (loop $inner_loop
          (nop)
          (br $inner_loop)
        )
      )
    )
  )
  "invalid nesting or control flow"
)