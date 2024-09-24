;; Test 4: Use a block with a `br_if` instruction followed by further statements. Verify that `br_if` correctly evaluates a condition based on global variables and does not execute subsequent instructions if the condition is true.

(assert_invalid
  (module
    (global $0 (mut i32) (i32.const 1))
    (func $test
      (block (result i32)
        (i32.const 0)
        (br_if 0 (global.get $0))
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)