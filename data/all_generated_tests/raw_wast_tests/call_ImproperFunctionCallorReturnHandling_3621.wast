;; 10. Construct a module with mutually recursive functions. Check for proper return management and that each function correctly returns back to its caller without disrupting the control flow.

(assert_invalid
  (module
    (func $mutual-recursion-1 (call $mutual-recursion-2))
    (func $mutual-recursion-2 (call $mutual-recursion-1))
  )
  "function recursive calls are invalid"
)