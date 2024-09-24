;; 1. A test where a nested block contains multiple nested loops, and a `br_table` instruction targets the outermost block. This will check if the implementation correctly maintains the label stack and jumps to the appropriate block level.

(assert_invalid
  (module (func $nested-blocks-br_table
    (block (result i32)
      (i32.const 0)
      (block (result i32)
        (loop (block (result i32)
          (block (result i64)
            (loop (result i64)
              (br_table 1 (i32.const 0))
            )
          )
        ))
      )
    )
  ))
  "type mismatch"
)