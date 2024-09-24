;; 2. **Test 2:** A loop that contains the `unreachable` instruction followed by a branch to ensure that once the `unreachable` instruction is triggered, the loop's control flow is correctly exited and no further branches are taken. ```wat (function (result i32)   (loop (result i32)     unreachable     (br 0)     (i32.const 30)   ) ) ```

(assert_invalid
  (module
    (func (result i32)
      (loop (result i32)
        unreachable
        (br 0)
        (i32.const 30)
      )
    )
  )
  "unreachable instruction causes immediate trap"
)