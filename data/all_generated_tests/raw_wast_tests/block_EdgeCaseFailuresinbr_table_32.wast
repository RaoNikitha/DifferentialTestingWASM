;; 3. Test Description: Utilize a `block` with several `br_table` instructions, one of which uses an index of -1. Check if `WebAssembly` catches this invalid negative index and if `wizard_engine` improperly tries to process it, leading to different behaviors.

(assert_invalid
  (module (func $test-br-table-invalid-index
    (block (result i32)
      (br_table -1 (i32.const 0) (block) (block))
      (i32.const 1)
    )
  ))
  "invalid label"
)