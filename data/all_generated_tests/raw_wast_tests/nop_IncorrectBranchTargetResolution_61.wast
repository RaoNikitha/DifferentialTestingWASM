;; Insert `nop` instructions inside a loop with multiple levels of nested blocks and branches to check if branch targets within loops are correctly resolved without affecting the execution flow in both implementations.

(assert_invalid
  (module
    (func $test
      (loop $L1
        (block $B1
          (br $B1)
          (nop)
          (block $B2
            (br $L1)
            (nop)
          )
        )
      )
    )
  )
  "unreachable code"
)