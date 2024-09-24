;; 3. Create a scenario with deeply nested `block` instructions with varying depths. Insert a `br` instruction targeting the second outermost block and verify proper operand unwinding, ensuring the `br` correctly interprets the nested structure depth.

(assert_invalid
  (module
    (func $deeply_nested_blocks
      (block
        (block
          (block
            (block
              (br 2)
            )
            (drop)
          )
          (drop)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)