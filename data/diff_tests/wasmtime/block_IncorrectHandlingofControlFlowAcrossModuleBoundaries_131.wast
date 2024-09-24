;; Design a `block` that invokes an exported function from another module. Ensure the exported function performs complex stack operations, and test whether the stack state matches expected values upon return from the function call inside the nested block.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func (result i32)))
    (func $test_block_with_import (result i32)
      (block (result i32)
        (call $external_func)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)