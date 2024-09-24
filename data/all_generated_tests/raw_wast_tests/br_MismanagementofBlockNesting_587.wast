;; 8. Create a nested loop structure where a `br` instruction targets the middle loop, ensuring that inner and outer loops are correctly managed and control flow respects the loop continuation rules.

(assert_invalid
  (module
    (func $test
      (block (loop (loop (block (br 1)))))
    )
  )
  "type mismatch"
)