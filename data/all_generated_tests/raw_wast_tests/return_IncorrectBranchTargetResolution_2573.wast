;; Simple function with multiple nested loops but only a single `return` statement in the innermost loop, to verify if the `return` instruction correctly resolves the outermost block as the target.

(assert_invalid
 (module
  (func $nested-loops-return (param i32) (result i32)
   (i32.const 0)
   (loop (result i32)
    (br_if 0 (i32.const 1))
    (loop (result i32)
      (return (i32.const 0))
    )
   )
  )
 )
 "type mismatch"
)