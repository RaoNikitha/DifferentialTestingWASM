;; Test 5: Place multiple `nop` instructions between a `block` start and an `unreachable` following the `end` of the block. Ensure that the `block` construct correctly processes and the flow correctly leads to the `unreachable`.

(assert_invalid
  (module (func
    (block
      (nop)
      (nop)
      (nop)
    )
    (unreachable)
  ))
  "unreachable code"
)