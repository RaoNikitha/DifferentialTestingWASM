;; 2. **Deeply Nested Blocks with Inner Block Exits:**    - Design a `br_table` within multiple nested blocks to test branching out of an innermost block based on varying operand values.    - Checks if the implementation correctly recognizes and exits multiple levels of nesting and handles stack unwinding properly.

(assert_invalid
  (module (func $nested_blocks_with_inner_exit
    (block (result i32)
      (block
        (block
          (br_table 0 1 2 (i32.const 3))
        )
      )
      (i32.const 0)
    )
  ))
  "label index out of range"
)