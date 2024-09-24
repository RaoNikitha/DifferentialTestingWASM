;; 10. Place a `nop` instruction between a comparison operation and a `br_if` that makes use of the comparison's result. Check the integrity of the condition evaluation for branching, confirming correctness of the branch based on the comparison outcome.

(assert_invalid
  (module
    (func $test
      (block $label
        (i32.const 1)
        (i32.const 2)
        (i32.eq)
        (nop)
        (br_if $label)
      )
    )
  )
  "expected type i32, got []"
)