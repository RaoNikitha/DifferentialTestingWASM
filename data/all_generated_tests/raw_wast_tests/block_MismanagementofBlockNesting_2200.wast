;; 1. Create a `block` instruction nesting with multiple layers of `block` and `loop` instructions, and include a `br_table` that targets different nesting depths. Validate if the implementation correctly interprets the depth and resumes at the right block when the labels are used incorrectly.

(assert_invalid
  (module (func $nested-block-br_table
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (br_table 1 0)
          )
          (i32.const 0)
        )
        (i32.const 1)
      )
      (i32.const 2)
    )
  ))
  "type mismatch"
)