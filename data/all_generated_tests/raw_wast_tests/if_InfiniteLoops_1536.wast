;; 7. A test with a deeply nested `if-else` structure within multiple loops, where the `if` condition in the innermost block always evaluates true, ensuring that all loop contexts exit appropriately without getting stuck in infinite loops.

(assert_invalid
  (module
    (func $deeply_nested_if
      (loop $L1
        (loop $L2
          (i32.const 1)
          (if (result i32)
            (then
              (loop $L3
                (i32.const 1)
                (if (result i32)
                  (then
                    (loop $L4
                      (i32.const 1)
                      (if (result i32)
                        (then
                          (br $L1) ; Exit to outermost loop
                          (i32.const 999)
                        )
                        (else (i32.const 1))
                      )
                    )
                  )
                  (else (i32.const 999))
                )
              )
            )
            (else (i32.const 999))
          )
        )
      )
    )
  )
  "type mismatch"
)