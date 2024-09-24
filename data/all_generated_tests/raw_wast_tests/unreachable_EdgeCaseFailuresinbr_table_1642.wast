;; 3. Construct a sequence with a `br_table` index equal to the number of entries but with all entries leading to `unreachable` instructions. Ensure both implementations trap immediately and consistently after the `br_table` index check.

(assert_invalid
  (module (func $br_table_all_unreachable
    (block $label0
      (block $label1
        (block $label2
          (br_table $label0 $label1 $label2 (i32.const 3))
        )
        (unreachable)
      )
      (unreachable)
    )
    (unreachable)
  ))
  "type mismatch"
)