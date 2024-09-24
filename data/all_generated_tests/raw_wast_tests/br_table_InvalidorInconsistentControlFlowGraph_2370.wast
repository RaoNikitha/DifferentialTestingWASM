;; 10. **Test for Misaligned Blocks and Control Flow Errors:**    - **Description:** Construct a block with `br_table` containing forward branches that exit and re-enter various nested blocks incorrectly, causing potentially unreachable code paths.    - **Constraint Checked:** Ensuring the CFG prevents misaligned branches that exit incorrectly and lead to code segments that should be unreachable.

(assert_invalid
  (module
    (func $misaligned-blocks
      (block
        (block (result i32)
          (block
            (block (br_table 1 0 2))
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)