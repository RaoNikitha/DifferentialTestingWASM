;; 3. Instantiate an `if` statement that uses a `nop` within the then and else branches. Place an `i64.const` and `i64.and` operation after the `nop` in each branch. This differential test analyzes if `nop` correctly handles the type flow when used within conditional branches.

(assert_invalid
  (module
    (func $conditional-nop
      (if (i32.const 1)
        (then
          (nop)
          (i64.const 0)
          (i64.const 0)
          (i64.and)
        )
        (else
          (nop)
          (i64.const 0)
          (i64.const 0)
          (i64.and)
        )
      )
    )
  )
  "type mismatch"
)