;; 7. Within an `if` block, use an imported function that uses an internal loop to verify if nested control flows within the imported module do not interfere with the host execution flow.

(assert_invalid
  (module
    (import "env" "test_func" (func $test_func (result i32)))
    (func $if_block_loop_issue (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (call $test_func)
          (loop $loop
            (br_if $loop (i32.const 1))
          )
        )
        (else
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)