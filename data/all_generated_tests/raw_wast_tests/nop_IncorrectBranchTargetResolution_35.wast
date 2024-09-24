;; - Test Description 6: Develop a scenario where a `br_table` instruction is used within blocks, with `nop` instructions placed before the `br_table` call. Confirm whether the `nop` affects the resolution of labels in the `br_table`, leading to incorrect branching.

(assert_invalid
  (module
    (func $test-brtable
      (block $label0
        (block $label1
          (nop)
          (br_table $label1 $label0 (i32.const 1))
        )
      )
    )
  )
  "unexpected instruction"
)