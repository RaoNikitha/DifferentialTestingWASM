;; 10. Test a `br_if` instruction within an `if` block that has complex logical conditions determining the final branch condition. This reveals if erroneous evaluation leads to the incorrect control path being taken, skipping necessary instructions.

(assert_invalid
  (module
    (func $complex-br-if-test
      (if (i32.const 1)
        (then
          (i32.const 5)
          (br_if 0 (i32.and (i32.const 1) (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)