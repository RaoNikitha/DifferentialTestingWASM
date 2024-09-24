;; - Test 10: Craft a loop with nested blocks and add `br` instructions in different cases of executing blocks and nested blocks to jump out of the entire loop structure prematurely. Ensure it correctly exits the right number of nested instructions and the loop from any depth level.  These tests comprehensively cover different aspects of mismanagement of block nesting in loops concerning `br`, `br_if`, and `br_table` instructions, focusing on control depth and contextual targets under varied conditional and nested configurations.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (i32.const 1)
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)