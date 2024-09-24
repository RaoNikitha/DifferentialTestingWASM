;; 4. Include a sequence of `if-else` conditions nested inside multiple blocks and place a `return` statement within the `else` branch of the innermost conditional. This checks for the proper handling of stack unwinding and block termination upon hitting specific conditional branches.

(assert_invalid
  (module
    (func $nested-if-else-return
      (block
        (block
          (block
            (block
              (if (i32.const 1)
                (then)
                (else (return))
              )
              (i32.const 0)
            )
            (i32.const 0)
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)