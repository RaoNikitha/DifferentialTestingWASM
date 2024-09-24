;; 6. Construct a test with an `if` condition that contains several nested `block` and `loop` structures, with a `br` instruction targeting one of the blocks in the `else` branch. This tests label indexing and control flow handling within conditional branches.

(assert_invalid
  (module
    (func $nested-br (param i32) (result i32)
      (block (result i32)
        (if (result i32)
          (i32.const 1)
          (block (result i32)
            (loop (result i32)
              (br 3)
              (i32.const 0)
            )
            (i32.const 0)
          )
          (i32.const 0)
        )
      )
    )
  )
  "unknown label"
)