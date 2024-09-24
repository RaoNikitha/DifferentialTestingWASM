;; 5. Embed `nop` instructions within a sequence of `call` and `return` instructions in a function. Evaluate if the function terminates and returns correctly, with no intermediate steps being skipped due to CFG misinterpretations.

(assert_invalid
  (module
    (func $test-func
      (call $some_func)
      nop
      (return)
      nop
    )
    (func $some_func)
  )
  "type mismatch"
)