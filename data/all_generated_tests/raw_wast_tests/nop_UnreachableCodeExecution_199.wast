;; Test 10: Utilize `nop` inside a try-catch block where the `catch` part ends with an `unreachable`. Verify that `nop` does not prevent control flow from correctly trapping and reaching the `unreachable`.

(assert_invalid 
  (module 
    (func (try 
            (do (nop)) 
            (catch 
              (nop) 
              (unreachable)
            )
          )
    )
  ) 
"unreachable executed"
)