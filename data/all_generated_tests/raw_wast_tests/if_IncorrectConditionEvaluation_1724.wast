;; - Construct an `if` instruction where the condition is dynamically evaluated (e.g., a comparison operation result) to check if dynamic conditions are evaluated correctly leading to the correct branch execution.

(assert_invalid
  (module (func $dynamic-condition (result i32)
    (if (result i32) 
        (i32.eq (i32.const 5) (i32.add (i32.const 2) (i32.const 3))) 
      (then (i32.const 1)) 
      (else (i32.const 0))
    )
  ))
  "type mismatch"
)