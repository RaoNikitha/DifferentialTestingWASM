;; 2. Test an `if` instruction with an unreachable instruction at the start of the `else` block:    ```    if (i32.const 0)       nop     else       unreachable     end    ```    This checks if the implementation correctly traps when the `unreachable` code in the `else` block is reached due to a false condition.

(assert_invalid
  (module
    (func
      (if (i32.const 0)
        (then nop)
        (else unreachable)
      )
    )
  )
  "unreachable instruction in else block"
)