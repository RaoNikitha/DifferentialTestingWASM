;; 5. Test an `if` instruction with an `unreachable` instruction in a nested `block` within the `then` part:    ```    if (i32.const 1)       block         unreachable       end     else       nop     end    ```    This checks if the implementation correctly identifies and traps when an `unreachable` instruction within a nested `block` is reached.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (then
          (block
            (unreachable)
          )
        )
        (else
          (nop)
        )
      )
    )
  )
  "unreachable instruction"
)