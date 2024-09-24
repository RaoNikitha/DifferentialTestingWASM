;; 8. Create a differential test where an `if` instruction with the `blocktype` of `[] -> [i32]` has a `then` branch trying to push an out-of-bound `i64` type instead. This ensures output type consistency even in edge cases.

(assert_invalid
 (module
  (func $test (result i32)
   (if (result i32) (i32.const 1)
    (then (i64.const 42))
   )
  )
 )
 "type mismatch"
)