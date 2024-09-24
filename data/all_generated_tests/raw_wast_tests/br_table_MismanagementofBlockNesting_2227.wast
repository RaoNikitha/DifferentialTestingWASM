;; 7. Create a setup with a deeply nested block structure and a `br_table` instruction with operand values that specifically target the innermost and outermost blocks. This tests correct block depth handling.

(assert_invalid
  (module (func
    (block (result i32)
      (block
        (block
          (block
            (br_table 2 3 1 0 (i32.const 3))
          )
        )
      )
    )
  ))
  "unknown label"
)