;; Test 2: Insert a `nop` instruction inside a nested `block` structure before a `br_if` instruction, ensuring that the `br_if` correctly resolves its label based on the `block` scope unchanged by the `nop`.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (nop)
          (br_if $outer (i32.const 1))
        )
      )
    )
  )
  "unexpected end of block"
)