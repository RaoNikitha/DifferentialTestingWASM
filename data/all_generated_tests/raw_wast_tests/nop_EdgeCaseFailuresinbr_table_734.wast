;; 5. Utilize a `br_table` with a mix of normal and unexpected high indices, combined with `nop` instructions strategically placed before and after the `br_table`. This will determine if `nop` alters the way `br_table` processes indices.

(assert_invalid
  (module
    (func $mixed-br-table
      (block $exit
        (br_table $exit $exit 1 (nop))
      )
    )
  )
  "type mismatch"
)