;; - Test 5: Use a `br_table` instruction within a loop where the branch index overflows the table. This should direct to a default branch causing loop exit and re-entry. Validate stack continuity after such indirect branches.

(assert_invalid
  (module
    (func $br_table_overflow (result i32)
      (loop $start
        (block $default
          (br_table $default $start (i32.const 1))
        )
        i32.const 0
      )
    )
  )
  "type mismatch"
)