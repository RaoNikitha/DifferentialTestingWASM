;; Test 5: Write a block containing a loop with complex branching (`br_table`) where the conditionals refer to outer block contexts. Ensure the block type requires `i32` and check if WebAssembly accurately breaks out of the loop when conditions are met, unlike `wizard_engine`, which may mishandle stack unwinding and loop indefinitely.

(assert_invalid
  (module (func $complex-br-table-loop (result i32)
    (block (result i32)
      (i32.const 0)
      (loop (result i32)
        (br_table 0 0 1 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)