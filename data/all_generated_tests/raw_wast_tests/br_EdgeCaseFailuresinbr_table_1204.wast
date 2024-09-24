;; 5. Construct a `br_table` where the targets are deeply nested `blocks` and one of the target indices points to a `loop` entry. This ensures implementations correctly navigate through complex nested structures.

(assert_invalid
  (module 
    (func $nested-br-table
      (block 
        (block
          (loop 
            (br_table 0 1 2 (i32.const 2))
          )
        )
      )
    )
  )
  "unknown label"
)