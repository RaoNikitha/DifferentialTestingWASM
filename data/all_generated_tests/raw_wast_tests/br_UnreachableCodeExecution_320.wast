;; 1. **Nested Block with Valid Label but Unreachable in Between:**    - Create a nested block structure where an inner block contains a `br` instruction targeting an outer block and has an `unreachable` instruction in between. The test should verify if the `br` instruction correctly ignores the unreachable code and resumes after the outer block ends.    - This checks if the `br` instruction handles label targeting correctly without erroneously executing the unreachable code.

(assert_invalid
  (module
    (func $test 
      (block $outer
        (block
          (unreachable)
          (br 1)
        )
      )
      (i32.const 1)
    )
  )
  "unknown label"
)