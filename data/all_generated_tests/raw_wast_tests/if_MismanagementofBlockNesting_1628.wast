;; Test 9: Configure an `if` block containing nested `if` instructions with mixed `block` and `loop` structures, including cross-referencing `br` instructions. The goal is to ensure that each `if` and `else` path respects nested block encapsulations and branch targets without overreaching.

(assert_invalid
  (module (func $test_nesting_if_with_branches
    (block $outer
      (if (result i32) (i32.const 1)
        (then
          (block $inner
            (if (result i32) (i32.const 0)
              (then
                (loop $inner_loop
                  (br_if $outer (i32.const 1))
                )
                (i32.const 42)
              )
              (else
                (br $inner)
              )
            )
          )
        )
        (else
          (i32.const 1)
        )
      )
    )
  ))
  "type mismatch"
)