;; A recursive function with multiple nested calls and a `return` instruction placed strategically to test whether the return correctly exits the deepest nested call to return to the top-level function.

(assert_invalid
  (module
    (func $nested-return (result i32)
      (i32.const 42)
      (block
        (block
          (block
            (return) ; This return should exit all the way to the top.
            (i32.const 0)
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)