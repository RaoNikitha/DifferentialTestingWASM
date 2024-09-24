;; Test 6: A `br_table` instruction where the branch targets include a mix of loops, blocks, and if blocks. An error in resolving the target index would jump to an incorrect code section, altering the expected control flow.

(assert_invalid
  (module
    (func (result i32)
      (block $b0 (loop $l0
        (br_table $b0 $l0) (i32.const 0)
      ))
    )
  )
  "type mismatch"
)