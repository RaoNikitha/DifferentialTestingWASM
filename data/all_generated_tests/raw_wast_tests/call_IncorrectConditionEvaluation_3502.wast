;; - In a module, define a function that takes two parameters and returns their sum. Call this function with two integers using the `call` instruction. Verify if the stack operations align correctly with the type matching for both parameters and the result.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (func (type 0) (i32.const 5) (i32.const 10) call 0)
  )
  "type mismatch"
)