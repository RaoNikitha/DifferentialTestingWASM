;; 8. **Function Exit with Invalid Br Target:**    Call a function that includes a `br` instruction targeting an invalid depth, which is beyond the function call stack. This checks how the implementations handle errors related to out-of-bounds label indices in the context of function returns.

(assert_invalid
  (module (func $invalid-br-target
    (block $outer
      (block $inner
        (br 2) 
      )
    )
  ))
  "invalid label"
)