;; Test 1: Create a block with a `blocktype` resulting in `i32` but structured with an infinite loop where a `br_if` always branches back to the start of the block due to a constant true condition. Check if WebAssembly exits the loop correctly when the block ends, whereas `wizard_engine` may fail due to improper `checkArgsAndTransfer` handling.

(assert_invalid
  (module (func $test-infinite-loop (result i32)
    (block (result i32)
      (loop (result i32)
        (br_if 0 (i32.const 1))
      )
    )
    (i32.const 0)
  ))
  "unreachable"
)