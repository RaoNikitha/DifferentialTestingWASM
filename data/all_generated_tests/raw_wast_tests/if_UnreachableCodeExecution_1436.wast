;; 7. Test an `if` instruction that ends with an `unreachable` instruction, ensuring loops don’t inadvertently reach it:    ```    if (i32.const 1)       loop         br 0       end       unreachable     end    ```    This verifies if the `loop` and `br` correctly prevent reaching the `unreachable` instruction.

(assert_invalid
  (module
    (func
      (if (i32.const 1)
        (loop
          (br 0)
        end)
        unreachable
      end)
    )
  )
  "unreachable code"
)