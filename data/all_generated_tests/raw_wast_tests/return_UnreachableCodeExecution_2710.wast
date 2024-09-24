;; Test 9: Combine multiple nested `return`s within blocks, ensuring an `unreachable` at the outermost block. Reason: Confirms correct nested block unwinding and `return` propagation.

(assert_invalid
  (module
    (func $nested-returns-test
      (block
        (block
          (block
            (return)
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)