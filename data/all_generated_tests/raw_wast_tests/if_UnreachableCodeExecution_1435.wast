;; 6. Test an `if` instruction with an `unreachable` instruction in a nested `block` within the `else` part:    ```    if (i32.const 0)       nop     else       block         unreachable       end     end    ```    This ensures that when the condition is false, control flow reaching a `block` in the `else` part containing `unreachable` triggers a trap.

(assert_invalid
  (module
    (func
      (if (i32.const 0)
        (then
          nop
        )
        (else
          (block
            unreachable
          )
        )
      )
    )
  )
  "unreachable instruction within else block"
)