;; 3. A test with deeply nested `if` instructions within multiple levels of loop structures, with each `if` containing its own `else` branch. This checks if the `if-else` instruction correctly handles the nested loops' exit conditions.

(assert_invalid
  (module
    (func $deeply_nested_if_else
      (i32.const 1) ;; condition for the outermost if
      (if (result i32)
        (then ;; outermost then
          (i32.const 1) ;; condition for the first nested if
          (if (result i32)
            (then ;; first nested then
              (i32.const 1) ;; condition for the second nested if
              (if (result i32)
                (then ;; second nested then
                  (i32.const 1)
                  (i32.const 2)
                )
                (else ;; second nested else
                  (i32.const 3)
                )
              )
            )
            (else ;; first nested else
              (i32.const 4)
            )
          )
        )
        (else ;; outermost else
          (i32.const 5)
        )
      )
      (drop)
    )
  )
  "type mismatch"
)