;; 5. Nested `if`, `block`, and `loop` controls with a `br` instruction targeting various depths of the block structure. This checks if the `br` correctly identifies the target label and appropriately adjusts the stack. Constraints checked: relative label indexing, stack type correctness.

(assert_invalid
  (module
    (func $nested-br
      (block $outer
        (block $middle
          (loop $inner
            (if (i32.const 1) 
              (then
                (br 2)
              )
            )
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)