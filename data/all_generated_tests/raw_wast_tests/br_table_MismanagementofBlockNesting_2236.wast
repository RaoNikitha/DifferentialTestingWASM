;; 6. **Test Description:** Develop a module with consecutive `block` declarations, where a `br_table` instruction might cause an erroneous branch due to the misalignment of stack heights and label indices within nested structures more than two levels deep.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (block (result i32)
            (block (result i32)
              (br_table 0 1 1 (i32.const 0) (i32.const 1))
            )
          )
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)