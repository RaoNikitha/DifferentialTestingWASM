;; Test 5: Create a loop inside a block where `br_if` depends on a condition that alters on each iteration of the loop, ensuring the loop exits correctly based on the changing condition.

(assert_invalid
  (module (func $type-loop-block-mismatch (result i32)
    (block (result i32)
      (loop (result i32)
        (i32.const 1)
        (br_if 1 (i32.const 0))
        (br 0)
      )
    )
  ))
  "type mismatch"
)