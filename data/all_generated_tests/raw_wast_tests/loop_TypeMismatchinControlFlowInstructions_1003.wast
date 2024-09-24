;; 4. **Test for Loop with Indirect Branch Table**: Create a loop containing a `br_table` instruction that includes branches to blocks with varying types, some of which do not match the loop's expected result type.

(assert_invalid
  (module
    (func $indirect_br_table (param i32) (result i32)
      (loop (result i32)
        local.get 0
        br_table 0 0
      )
    )
  )
  "type mismatch"
)