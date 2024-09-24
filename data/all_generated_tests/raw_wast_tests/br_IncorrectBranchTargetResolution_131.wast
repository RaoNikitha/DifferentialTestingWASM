;; 2. **Loop with Inner If and Block:**    Implement a `loop` containing nested `if` and `block` instructions. Use a `br` to target the loop from within the nested `if` block. Confirm that the branch correctly resolves to restart the loop.

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        (block (result i32)
          (if (result i32)
            (i32.const 1)
            (then
              (br 1) ;; Branch to loop
            )
            (else
              (i32.const 0)
            )
          )
          (i32.const 0)
        )
      ) ;; End of loop
      (i32.const 0)
    )
  )
  "type mismatch"
)