;; 6. Design a `block` that includes a `loop` with a mismanaged stack transition followed by a `br` instruction to an outer block. This check targets wizard_engine's validation flaws causing an infinite loop.

(assert_invalid
  (module
    (func $test
      (block
        (loop
          (block $outer
            (drop) ;; Incorrect stack operation 
            (br 1) ;; Branch to the outer block
          )
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)