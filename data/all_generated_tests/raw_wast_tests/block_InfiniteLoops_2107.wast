;; Test 8: Use a block with a loop involving indirect branching (`br_table`). The block type mandates an `i32` result. Check if WebAssembly handles indirect branches correctly and breaks the loop, while `wizard_engine` might mishandle table branch indices resulting in endless looping.

(assert_invalid
  (module
    (func $test (result i32)
      (block (result i32)
        (loop
          (block (result i32)
            (br_table 0 0 0 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)