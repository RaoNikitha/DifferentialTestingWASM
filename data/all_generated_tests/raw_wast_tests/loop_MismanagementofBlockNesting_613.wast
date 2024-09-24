;; 4. **Overlapping Loop Labels**: Create a scenario with two nested loops having identical local labels, followed by a `br_table` instruction. This will test whether the different implementation methods respect the unique identification of each loop’s label in a nested context, highlighting any mismanagement.

(assert_invalid
  (module
    (func $nested-loops-with-br_tables
      (loop (param i32)
        (loop (param i32)
          br_table 0 1
        )
      )
    )
  )
  "type mismatch"
)