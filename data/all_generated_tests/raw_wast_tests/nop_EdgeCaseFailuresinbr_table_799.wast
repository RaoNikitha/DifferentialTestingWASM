;; 10. Create a test case with a `br_table` instruction inside a `loop` structure, where several loops contain `nop` instructions, each loop having different `br_table` targets. Check if the `nop` instructions affect the selection of the correct branch target or loop iteration logic.

(assert_invalid
  (module
    (func $test (block $outer (loop $inner (br_table $inner $outer (nop) (nop)))))
  )
  "type mismatch"
)