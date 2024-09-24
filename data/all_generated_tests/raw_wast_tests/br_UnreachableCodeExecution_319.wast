;; 10. Compose a script with a chain of nested `block` instructions. Use `br` targeting an invalid index that breaks the structured control enforcement, resulting in the unplanned execution of an `unreachable` instruction.

(assert_invalid
  (module
    (func $nested-blocks
      (block
        (block
          (block
            (br 3)
          )
          (unreachable)
        )
      )
    )
  )
  "invalid break"
)