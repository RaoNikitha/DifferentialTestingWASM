;; 6. Create a deeply nested series of `block` and `loop` instructions interleaved with several `nop` operations, ensuring the stack's state remains intact throughout all nested level entries and exits.

(assert_invalid
  (module
    (func $nested
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (block
                        (block
                          (loop
                            (nop)
                            (br 1)
                          )
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
      (i32.const 0)
      (drop)
    )
  )
  "type mismatch"
)