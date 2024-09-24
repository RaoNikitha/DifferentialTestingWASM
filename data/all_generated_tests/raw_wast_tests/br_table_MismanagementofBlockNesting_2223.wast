;; 3. Include a `br_table` instruction inside a loop, with labels that refer back to previous blocks. Ensure the operand falls in the range of these label indices to verify that loops are correctly integrated with the branching instructions.

(assert_invalid
  (module
    (func $br_table_in_loop
      (block $out
        (block $inner
          (loop $loop
            (i32.const 1)
            (br_table $inner $loop $out)
          )
        )
      )
    )
  )
  "unknown label"
)