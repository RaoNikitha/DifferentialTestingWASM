;; 3. **Test for Incorrect Stack Type After Return**: Create a function where a `return` instruction within a loop or block unwinds the stack but leaves behind a mismatched type, such as an `i32` instead of the expected `i64`. This tests handling of incorrect stack height/type on returning.

(assert_invalid
  (module
    (func $incorrect-stack-type-after-return (result i64)
      (block
        (i32.const 42)
        (return)
      )
    )
  )
  "type mismatch"
)