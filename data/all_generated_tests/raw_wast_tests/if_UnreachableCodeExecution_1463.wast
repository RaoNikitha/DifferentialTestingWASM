;; 4. Construct an `if` instruction with an `else` branch containing an `unreachable` instruction inside a nested `block`. Confirm that when the condition is false, the valid control flow does not bypass into the `else` branch without trapping.

(assert_invalid 
  (module 
    (func $test 
      (if (result i32) 
        (i32.const 0) 
        (then (i32.const 1)) 
        (else (block (unreachable)))
      )
    )
  )
  "unreachable instruction"
)