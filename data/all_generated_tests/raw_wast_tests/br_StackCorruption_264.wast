;; 5. **Test Name: Empty Stack on Conditional Branch**    - Create a scenario where an `if-else` block branches based on a condition, but the stack is empty when a `br` instruction is executed. This checks for empty stack handling.

(assert_invalid
 (module
  (func (block
   (if (i32.const 1)
    (then (br 0))
    (else (br 1))
   )
  ))
 )
 "unknown label"
)