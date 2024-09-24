;; 2. **Test 2**: A nested loop where the inner loop contains a `br_if` instruction that checks for an exit condition that depends on the outer loop's variable. This tests the label references where incorrect label handling will lead to an infinite loop.

(assert_invalid
  (module
    (func $nested-loop-br_if
      (loop (block
        (loop
          (local.get 0)
          (i32.const 1)
          (i32.eq)
          (br_if 1) ; Incorrectly referencing the outer block instead of the outer loop
        )
      ))
    )
  )
  "unknown label"
)