;; 3. **Backward Branch in Nested Function Call:**    - Create a nested `loop` containing a `call` to a function which itself includes another `loop`. Add a `br` instruction targeting the outer loop after the function call. Validate that the branch targets the correct loop level after returning from the function call.

(assert_invalid
  (module
    (func $nestedFunction
      (loop $inner_loop
        (br 2)
      )
    )
    (func $testFunc
      (loop $outer_loop
        call $nestedFunction
        br 1
      )
    )
  )
  "unknown label"
)