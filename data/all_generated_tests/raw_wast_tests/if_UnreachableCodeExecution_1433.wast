;; 4. Test an `if` instruction with a branch (`br`) instruction that erroneously maps to an `unreachable` label:    ```    block       if (i32.const 1)         br 1         unreachable       end     end    ```    This checks if a branch instruction mistakenly takes the control to an `unreachable` instruction, verifying proper branch handling.

(assert_invalid
  (module
    (block
      (if (i32.const 1)
        (then 
          (br 1) 
          (unreachable)
        )
      end)
    )
  )
  "type mismatch"
)