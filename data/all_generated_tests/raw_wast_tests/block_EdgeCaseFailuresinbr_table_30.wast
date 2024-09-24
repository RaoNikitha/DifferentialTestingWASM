;; 1. Test Description: Create a `block` instruction containing a `br_table` with an index exceeding the total number of labels. Verify that `WebAssembly` validates the index properly and raises an error, while `wizard_engine` may fail to handle the out-of-bounds index correctly.

(assert_invalid
  (module (func $br_table-out-of-bounds
    (block (block (block
      (br_table 3 (i32.const 0))
    )))
  ))
  "invalid label"
)