;; 1. Test a function with nested blocks where the inner block contains a `return` instruction immediately followed by unreachable code in WebAssembly's context validation, and check to see if the Wizard Engine's `setUnreachable` correctly marks the code unreachable.

(assert_invalid
 (module
  (func
   (block
    (block
     (return)
     unreachable
     )
    )
  )
  "unreachable code after return"
 )