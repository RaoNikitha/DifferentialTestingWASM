;; 4. Implement a function that contains a `br_table` with an index derived from a parameter. Pass an invalid index via the calling `call` instruction. This should test if wizard_engine's argument checking (`checkAndPopArgs`) differs in behavior when handling incorrect inputs.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (func $test (param i32)
      (block
        (br_table 0 1 (local.get 0))
      )
    )
    (func (call $test (i32.const 2)))
  )
  "invalid br_table index"
)