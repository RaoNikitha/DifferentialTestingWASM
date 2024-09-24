;; 9. Craft a test where `br_table` is at the end of a function, and multiple `nop` instructions precede it. Ensure the `nop` instructions don't interfere with the bounds checking and determination of whether the index is out of bounds.

(assert_invalid
  (module
    (func $test-func
      (nop) (nop) (nop) (br_table 0 1 2 (i32.const 3))
    )
  )
  "br_table index out of bounds"
)