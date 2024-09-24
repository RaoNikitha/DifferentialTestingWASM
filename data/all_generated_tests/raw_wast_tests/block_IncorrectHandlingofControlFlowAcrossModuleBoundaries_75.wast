;; 6. **Block with Return from Imported Function**:    - Create a block that calls an imported function which contains a `return` statement. This test checks if the return is appropriately managed and the control flow correctly transitions back to and exits from the block.

(assert_invalid
  (module
    (import "env" "test_func" (func $test_func (result i32)))
    (func $block_with_return_import (result i32)
      (block (result i32)
        (call $test_func)
        (return)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)