;; 10. **Test Call Leading to Function Depth Limit**:     Call functions in deep nested calls, exceeding the maximum function depth allowed, to check if it properly traps or erroneously executes an `unreachable` instruction due to improper function call stack handling.

(assert_invalid
 (module
  (func $depth-limit-test
   (call 0)
   (call 0)
   (call 0)
   (call 0)
   (call 0)
   ; Add more calls as needed to exceed the maximum function call depth
  )
  (func) 
 )
 "exceed maximum function depth"
)