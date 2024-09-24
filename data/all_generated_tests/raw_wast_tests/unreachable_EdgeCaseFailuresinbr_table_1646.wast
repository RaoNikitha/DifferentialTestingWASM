;; 7. Utilize a `br_table` instruction with mixed index values (within bounds and out-of-bounds), ensuring all paths eventually lead to an `unreachable` instruction. Validate consistent trapping behavior.

(assert_invalid
  (module
    (func $test-br_table-unreachable
      (block $default
        (block $label1
          (block $label2
            (i32.const 0)  ;; index for br_table
            (br_table 0 1 2 (block $invalid))
            (unreachable)
          )
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "index out of bounds"
)