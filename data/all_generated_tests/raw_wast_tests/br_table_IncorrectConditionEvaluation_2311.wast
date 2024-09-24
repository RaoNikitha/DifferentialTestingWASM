;; 1. Test a `br_table` instruction with a condition that always evaluates to true. Verify if the branch mistakenly triggers on the first (default) label instead of the correct conditional label.

(assert_invalid
  (module
    (func $test_case (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 0) (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)