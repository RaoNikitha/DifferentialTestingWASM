;; Test 7: Establish a deeply nested `if` instruction inside several `block` and `loop` structures, with `unreachable` instructions at various points. Ensure that traps are caught, and flow control correctly aborts to avoid further stack mismanagement or unintentional block exits.

(assert_invalid
  (module
    (func $nested-ifs
      (block
        (loop
          (if (i32.const 1)
            (then
              (block
                (if (i32.const 0)
                  (then
                    (unreachable)
                  )
                )
              )
            )
            (else
              (unreachable)
            )
          )
        )
      )
    )
  )
  "unreachable executed"
)