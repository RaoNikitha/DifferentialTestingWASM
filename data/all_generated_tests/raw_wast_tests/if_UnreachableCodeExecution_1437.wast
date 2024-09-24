;; 8. Test an `if` instruction where the instruction stack should underflow leading to an `unreachable` state:    ```    if (i32.const 1)       drop       unreachable     else       nop     end    ```    This checks for correct stack management to prevent reaching an `unreachable` after manipulating the stack.

(assert_invalid
  (module
    (func $if-stack-underflow
      (if (result i32) (i32.const 1) (then (drop) (unreachable)) (else (nop)))
    )
  )
  "type mismatch"
)