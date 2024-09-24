;; - Test 3: Construct a scenario where a function invokes another, then issues a `br_if` instruction to branch based on the function's result to different target blocks. Check if the conditional branching is resolved to the correct block.

(assert_invalid
  (module
    (func $caller
      (call $callee)
      (br_if 0 (i32.const 1))
    )
    (func $callee (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)