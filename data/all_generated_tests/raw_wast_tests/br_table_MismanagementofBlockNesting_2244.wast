;; 4. **Block and Loop with Forward Branch Misalignment:**    - Create a scenario with a `br_table` inside a block that contains a loop, testing forward branching within the loop.    - Verifies that the `br_table` correctly understands the control flow and doesn’t improperly exit from the loop or the enclosing block.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br_table 0 1 (i32.const 2))
        )
        (i32.const 1)
      )
      (drop)
    )
  )
  "type mismatch"
)