;; 5. Create a scenario where `br_if` branches to restart a `loop` that has a function call inside it. This will check if wizard_engine manages the loop's parameter types correctly and maintains function call consistency through the branch.

(assert_invalid 
  (module 
    (func $loop-with-call 
      (loop $top 
        (call $some_function) 
        (br_if $top (i32.const 1))
      )
    ) 
    (func $some_function)
  ) 
  "type mismatch"
)