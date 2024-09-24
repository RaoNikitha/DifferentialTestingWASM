;; 8. **Test Description:**    - Multiple nested `if` and `block`, immediate `br` to an invalid depth label followed by an `unreachable` instruction for checking label access validation.    - **Constraint: Misinterpreting Relative Label Indices**    - **Differential Behavior: The Wizard Engine should provide accurate label depth access, prevent arbitrarily reaching `unreachable`, unlike WebAssembly.**

(assert_invalid
  (module
    (func
      (block
        (if
          (block
            (br 3)
          )
        )
      )
      (unreachable)
    )
  )
  "invalid label"  
)