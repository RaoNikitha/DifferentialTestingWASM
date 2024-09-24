;; 6. **Test 6**: Design a function where `return` appears in a try-catch block context, checking if the `return` prematurely exits the block and the correct path is taken in the presence of exception handling constructs.

(assert_invalid
  (module
    (func $type-value-return-in-try-catch (result i32)
      (try 
        (do (return (i32.const 42)))
        (catch_all (return (i32.const 99)))
      )
    )
  )
  "type mismatch"
)