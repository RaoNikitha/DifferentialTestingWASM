;; Combine `nop` instructions with multiple conditional branches (`br_if`) to test if `nop` instruction incorrectly alters the evaluation logic leading to differential behavior.

(assert_invalid
  (module
    (func $test (block $label (br_if $label (i32.const 1)) (nop)))
  )
  "invalid conditional branch with nop"
)