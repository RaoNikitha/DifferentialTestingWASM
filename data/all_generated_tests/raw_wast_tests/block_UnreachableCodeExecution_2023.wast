;; 4. **Test Description**:    Create a deeply nested set of blocks where a `br_table` (branch table) directs control to various labels. Ensure one of the targets is an `unreachable` instruction. This test verifies both the handling of branch tables and trapping efficiency when encountering an `unreachable` target.

(assert_invalid
  (module 
    (func $deep-nest-br_table-unreachable
      (block 
        (block 
          (block 
            (block 
              (block (br_table 0 1 2 3 4 (i32.const 1))) 
              (unreachable)
            ) 
          ) 
        ) 
      ) 
    ) 
  )
  "unreachable execution"
)