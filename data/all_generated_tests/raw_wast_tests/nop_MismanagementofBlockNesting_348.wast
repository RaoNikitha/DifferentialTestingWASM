;; 9. **Test Multiple Nop in Deeply Nested Blocks**: Design a function with deeply nested block structures and multiple `nop` instructions. This ensures the control flow correctly navigates through nested blocks without any interference from the `nop`.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block
              (block
                (nop)
                (nop)
              )
              (nop)
            )
            (nop)
          )
          (nop)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)