;; 5. Implement a test where the `br` instruction within an `if` block targets an outer `block`. The test should check the proper stack state is maintained across the `br` and the conditional execution of the `if` block.

(assert_invalid
  (module
    (func $test-br-if-to-outer-block
      (block $outer
        (block $inner
          (i32.const 1)
          (if (br $outer))
        )
      )
    )
  )
  "type mismatch"
)