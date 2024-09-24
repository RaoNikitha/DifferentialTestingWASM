;; 10. **Test 10**: Develop a nested `loop` scenario inside an `if` block where breaking out of the outer loop depends on states altered within the `else` instruction. Ensure the proper use of `resetInit` to avoid endless looping due to incorrect state handling.

(assert_invalid
  (module 
    (func $test_nested_loop (param $x i32) (result i32)
      (if (result i32)
        (i32.eq (local.get $x) (i32.const 1))
        (then
          (i32.const 42)
        )
        (else
          (loop (result i32)
            (br_if 1 (i32.eq (local.get $x) (i32.const 0)))
            (br_if 0 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)