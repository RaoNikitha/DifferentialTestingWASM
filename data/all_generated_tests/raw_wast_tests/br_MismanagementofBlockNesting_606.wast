;; 7. Test Description: **Multiple Layered Blocks with Exiting Conditions**    - Create examples of three or more nested blocks, each terminated by a conditional `br` instruction. Validate correct exits to the right block based on different nesting depths.    - Constraint: Verifies proper block exit on conditional branching from nested blocks.

(assert_invalid
  (module 
    (func $multiple-layered-blocks
      (block
        (block
          (block
            (br_if 1 (i32.const 1))
            (i32.const 0)
          )
          (br_if 0 (i32.const 1))
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)