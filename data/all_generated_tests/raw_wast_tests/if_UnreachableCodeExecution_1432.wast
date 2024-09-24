;; 3. Test deeply nested `if` instructions where an unreachable instruction is buried deep within the conditional blocks:    ```    if (i32.const 1)       if (i32.const 1)         unreachable       else         nop       end     else       nop     end    ```    This test ensures the correct handling of deep nesting when the condition is true and leads to an `unreachable` instruction.

(assert_invalid
  (module (func (if (i32.const 1)
    (then
      (if (i32.const 1)
        (then unreachable)
        (else nop)
      end)
    )
    (else nop)
  end)))
  "unreachable instruction"
)