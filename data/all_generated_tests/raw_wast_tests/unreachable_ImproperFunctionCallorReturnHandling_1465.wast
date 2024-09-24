;; 6. **Test Description:**    - Recursive function call reaching `unreachable` and inspect if the trap halts the recursive sequence correctly.    - This test assesses the correct handling of recursive calls in the presence of `unreachable` instruction.

(assert_invalid
  (module (func $test-recursive-unreachable (result i32)
    (local $i i32)
    (if (i32.eq (local.get $i) (i32.const 0))
      (then (unreachable))
    )
    (call $test-recursive-unreachable (local.get $i))
  ))
  "type mismatch"
)