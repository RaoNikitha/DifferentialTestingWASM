;; 4. Prepare a test with multiple `block` instructions, each implementing `valtype?` block types. Configure the blocks to branch to their respective ends after pushing and popping stack values. This test will identify any inconsistencies in stack handling due to improper label indexing between the blocks.

(assert_invalid
  (module
    (func $multiple-blocks-with-valtype (result i32)
      (block (result i32)
        (i32.const 10)
        (br 0)
      )
      (block (result i32)
        (i32.const 20)
        (br 0)
      )
    )
  )
  "type mismatch"
)