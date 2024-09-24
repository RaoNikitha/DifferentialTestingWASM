;; 8. **Test 8: Sequence Including Multiple `nop` And `br_table` Instructions With Off-By-One Error**    - Construct a sequence having multiple `nop` instructions interspersed with `br_table` instructions potentially susceptible to off-by-one errors.    - Constraint: Verify that the `nop` does not inadvertently affect the index handling, revealing off-by-one issue in `br_table`.

(assert_invalid
  (module
    (func $off_by_one
      (block $label0
        (block $label1
          (br_table $label0 $label1 (i32.const 0))
          (nop)
          (br $label0)
          (nop)
          (br $label1)
          (nop)
        )
      )
    )
  )
  "label index out of bounds"
)