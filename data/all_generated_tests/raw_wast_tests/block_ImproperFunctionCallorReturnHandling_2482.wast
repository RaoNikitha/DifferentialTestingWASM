;; Create a nested block structure where an outer block contains a `call` to a function that immediately returns, while an inner block contains another `call` to another function. Compare if the implementations properly manage the return of each function, ensuring the stack unwinds correctly upon each return.

(assert_invalid
  (module
    (func $return_void (return))
    (func $return_void_again (return))
    (func $test
      (block
        (call $return_void)
        (block
          (call $return_void_again)
        )
      )
    )
  )
  "type mismatch"
)