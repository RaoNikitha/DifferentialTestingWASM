;; 3. Implement a function using a `select` instruction to choose between values and then return the result. Test if the condition to select the value is accurately reflected in the output. Incorrect condition evaluation may result in returning the wrong value or not unwinding the stack properly.

(assert_invalid
  (module
    (func $return_in_select (result i32)
      (i32.const 1)
      (select (return) (i32.const 1) (i32.const 2))
    )
  )
  "type mismatch"
)