;; Create an `if` instruction with deeply nested control instructions that go beyond the regular labeling, ensuring the stack’s state is correctly captured and maintained across deep control transfers.

(assert_invalid
  (module
    (func $deeply-nested-if (result i32)
      (if (result i32) (i32.const 1)
        (then
          (if (result i32) (i32.const 1)
            (then
              (if (result i32) (i32.const 1)
                (then
                  (if (result i32) (i32.const 1)
                    (then
                      (if (result i32) (i32.const 1)
                        (then
                          (br 1 (i32.const 5))
                        )
                        (else (i32.const 1))
                      )
                    )
                    (else (i32.const 1))
                  )
                )
                (else (i32.const 1))
              )
            )
            (else (i32.const 1))
          )
        )
        (else (i32.const 1))
      )
    )
  )
  "type mismatch"
)