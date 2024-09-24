;; 9. Place a `br_if` instruction that has its boolean condition set based on a global variable change within a block. Validate if condition reflects updates correctly. Failures indicate mis-evaluation of dynamic conditions.

(assert_invalid
  (module
    (global $cond (mut i32) (i32.const 0))
    (func $test_br_if_return
      (block
        (br_if 0 (global.get $cond))
        (global.set $cond (i32.const 1))
        (return)
      )
    )
  )
  "type mismatch"
)