;; Implement a deep nesting block with a `br_table` instruction that misconfigures a label index, leading to an `unreachable` instruction. This test focuses on validating proper unwinding of the operand stack and maintaining control flow constraints.

(assert_invalid
  (module
    (func $deep-nesting-misconfig-label
      (block
        (block
          (block
            (block
              (block
                (block
                  (br_table 0 1 2 3 4 (i32.const 5))
                  (unreachable)
                )
                (drop)
              )
              (drop)
            )
            (drop)
          )
          (drop)
        )
        (drop)
      )
    )
  )
  "unreachable must be marked"
)