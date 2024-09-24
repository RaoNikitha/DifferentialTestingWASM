;; 8. **Test Description**: Multiple consecutive `br_table` instructions with an intermediate inconsistent type scenario causing the second instruction to hit an `unreachable` instruction. This tests error propagation between consecutive `br_table` instructions.

(assert_invalid
  (module
    (func 
      (block 
        (br_table 0 (i32.const 1))
        (i32.const 1)
        (br_table 1 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "unreachable instruction hit"
)