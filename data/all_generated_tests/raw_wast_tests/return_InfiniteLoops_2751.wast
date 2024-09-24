;; 10. **Loop Exit via Mixed `br` and `return`**: Combine direct `br` instructions within a loop alongside stack-managing returns. Determine if the differing operand stack handling leads to consistent exits from the loop avoiding situations where the loop becomes infinite.

(assert_invalid
  (module
    (func $loop-exit-br-return
      (loop
        (br 1)
        (return (i32.const 1))
      )
    )
  )
  "type mismatch"
)