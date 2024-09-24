;; Test 3: A loop block followed by a `br_if` instruction that conditionally branches to the loop. If the operand is not correctly handled, it will resolve to the wrong branch target, resulting in control flow errors.

(assert_invalid
  (module
    (func $test_loop
      (local i32)
      (loop (block (result i32)
        local.get 0
        i32.const 0
        i32.eq
        br_if 1
      ))
    )
  )
  "type mismatch"
)