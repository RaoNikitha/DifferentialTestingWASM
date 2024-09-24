;; 6. **Test `br_if` Chain**: Several `br_if` instructions in sequence, with the last one targeting an `unreachable` instruction in a `loop`. The purpose is to test compounded impact on the stack and label arguments through multiple condition evaluations.

(assert_invalid
  (module
    (func $br_if_chain
      (block
        (block
          (loop
            (br_if 1 (i32.const 1))
            (br_if 0 (i32.const 0))
            (unreachable)
          )
        )
      )
    )
  )
  "unknown label"
)