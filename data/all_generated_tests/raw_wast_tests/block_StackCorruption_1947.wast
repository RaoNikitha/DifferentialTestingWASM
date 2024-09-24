;; 8. Construct a test with a single `block` that includes stack manipulation instructions followed by a `br_table` with jumps to different labels. Design the table to explore various stack heights, ensuring the differential behavior exposes inconsistencies in stack state due to flawed label indexing in `wizard_engine`.

(assert_invalid
  (module
    (func $block_with_br_table (result i32)
      (block (result i32)
        (i32.const 1)
        (i32.const 2)
        (i32.const 3)
        (br_table 0 0 (i32.const 4))
        (br 0 (i32.const 5))
      )
    )
  )
  "type mismatch"
)