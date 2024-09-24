;; Write a `block` instruction with nested blocks and a `br_table` that uses elements from the stack to determine branching, including a `br_if` condition inside. Validate that `br_if` condition evaluation interacts harmoniously with `br_table` choices, avoiding incorrect exits or stack state collapses.

(assert_invalid
  (module (func $nested-block-with-br_if-br_table
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2)
        (br_if 0 (i32.const 0))
        (block (result i32)
          (i32.const 3)
          (br_table 0 1 2 (i32.const 1))
        )
      )
      (br_if 0 (i32.const 0))
    )
  ))
  "type mismatch"
)