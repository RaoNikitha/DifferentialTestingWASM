;; 6. Create a `loop` instruction with a block type expecting no values on the stack, then use a `br_table` inside the loop that produces multiple mismatched types based on table indices. This checks if both engines enforce type conformity in cases of indirect branches.

(assert_invalid
  (module
    (func $type-mismatch-br-table
      (loop (result i32)
        (block (result i32)
          (i32.const 0)
          (br_table 0 1 (i32.const 42) (f32.const 3.14))
        )
      )
    )
  )
  "type mismatch"
)