;; 4. An `if` statement with branches that return different types, such as `i32` in the true branch and `i64` in the false branch, followed by a `br` instruction that tries to exit both branches. This checks for type consistency enforcement within conditional blocks.

(assert_invalid
  (module
    (func
      (block
        (if (result i64)
          (then
            (i32.const 0)
            (br 0)
          )
          (else
            (i64.const 0)
            (br 0)
          )
        )
      )
    )
  )
  "type mismatch"
)