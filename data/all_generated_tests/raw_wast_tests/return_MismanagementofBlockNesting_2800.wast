;; 9. Create a setup involving a `br_table` instruction that dynamically branches to different depths within nested blocks, and each possible target should have a `return` instruction. This validates consistency if `return` can appropriately exit the function regardless of the path taken by the `br_table`.

(assert_invalid
  (module
    (func (param $x i32) (result i32)
      (block
        (block
          (block
            (block
              (br_table 0 1 2 3 (local.get $x))
              (return)
            )
            (return)
          )
          (return)
        )
        (return)
      )
    )
  )
  "type mismatch"
)