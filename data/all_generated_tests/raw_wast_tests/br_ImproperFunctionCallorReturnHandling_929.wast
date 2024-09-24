;; 10. **Test Description:** Implement deeply nested control structures where a `call` is made at the deepest level, and a `br` instruction targets towards the outermost block. Assess if this deep call-and-branch scenario maintains stack and return integrity.

(assert_invalid
  (module
    (func $deep-nesting-call-br
      (block
        (loop
          (block
            (block
              (block
                (call $dummy)
                (br 3)
              )
            )
          )
        )
      )
    )
    (func $dummy)
  )
  "unknown label"
)