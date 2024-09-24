;; 2. **Loop with Nested If and NOP**: Implement a loop that contains an `if` statement with a `nop` inside the `then` and `else` branches. Validate that loop continues correctly after the `nop` execution within nested branches.

 ;; (module
  (func $loop_with_if_nop
    (local i32)
    loop (result i32)
      (local.get 0)
      if (result i32)
        nop
        (local.get 0)
      else
        nop
        (local.get 0)
      end
      nop
      br 1
    end
  )
)