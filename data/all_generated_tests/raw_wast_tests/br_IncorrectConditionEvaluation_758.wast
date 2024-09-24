;; Test 9: Construct a complex `block` with several `br_if` instructions, each depending on distinct logical conditions (e.g., AND, OR combinations). Verify that branching occurs accurately for true logical conditions, testing complex condition evaluations.

(assert_invalid
  (module
    (func $complex_block_with_br_if
      (block
        (if (i32.eqz (i32.and (i32.const 1) (i32.or (i32.const 2) (i32.const 3)))) 
          (then (br_if 0 (i32.const 1)))
        )
        (drop)
      )
    )
  )
  "type mismatch"
)