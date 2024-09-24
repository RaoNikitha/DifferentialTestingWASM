;; 10. Create a WebAssembly module with a function that uses `br_table` to branch conditionally to either a local block or a function imported from another module. Check for the correct label indexing and operand stack handling when the imported function is invoked across the module boundary.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $br_table_test
      (block $block0
        (block $block1 (br_table 1 $block0 (i32.const 1)))
        (call $external_func)
      )
    )
  )
  "unknown label"
)