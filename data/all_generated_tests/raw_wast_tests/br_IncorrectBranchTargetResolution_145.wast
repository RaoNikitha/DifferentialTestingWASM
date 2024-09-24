;; Introduce backward branches within several nested `loop` instructions and ensure the `br` instruction accurately targets the intended loop while maintaining correct stack polymorphism and type consistency.

(assert_invalid
 (module
  (func $nested-loops-with-br
    (loop (block (result i32)
      (i32.const 0)
      (loop (result i32)
        (block (result i32)
          (br 2)
        )
      )
    ))
  )
 )
 "type mismatch"
)