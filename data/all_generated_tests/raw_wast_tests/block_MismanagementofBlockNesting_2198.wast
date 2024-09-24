;; A test combining blocks and loops where a `br_if` from within the loop targets an outer block, verifying the stack and label management across mixed structures.

(assert_invalid
  (module (func $test-loop-block-br_if (result i32)
    (block (result i32)
      (loop (i32.const 1)
        (br_if 1 (i32.const 0))
        (i32.const 2)
      )
    )
  ))
  "type mismatch"
)