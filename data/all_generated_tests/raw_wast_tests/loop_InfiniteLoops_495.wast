;; Test 6: Design a loop with nested `block` and `if` instructions that conditionally branch back to the loop start using `br_if`, making sure label stacks align correctly.

(assert_invalid
  (module
    (func $test-loop-nested-br_if
      (loop (result i32)
        (block
          (if (i32.const 1)
            (then
              (block
                (block
                  (br_if 1 (i32.const 0))
                )
                (i32.const 0)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)