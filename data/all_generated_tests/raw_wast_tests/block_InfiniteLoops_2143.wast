;; Test Description 4: Structure a complex block with multiple branches (`br_table`) in nested loops. Each branch should attempt to exit to the block start based on certain conditions. Misindexing can lead these conditions to misfire, causing infinite looping.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block
          (loop (result i32)
            (f32.const 1.0)
            (br_table 1 0)
            (i32.const 0)
          )
        )
      )
    )
  )
  "type mismatch"
)