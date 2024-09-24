;; 3. Design a function with multiple conditionals where an unexpected condition leads to an `unreachable` instruction, to validate if the function traps correctly when the condition is satisfied.

(assert_invalid
  (module (func $multiple-conditionals 
    (i32.const 0) (if (result i32) 
      (then (unreachable) (i32.const 1)) 
      (else (i32.const 2))
    )
  ))
  "type mismatch"
)