;; 9. **Test Description:**    Test a `br_if` in tandem with a preceding `select` instruction where the condition should choose between values but incorrect popping causes the branch to always be taken independent of the real `select`’s outcome.

(assert_invalid
  (module
    (func $test_select_br_if
      (block
        (i32.const 1) (i32.const 2) (i32.const 0)
        (select) (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)