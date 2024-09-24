;; - Test 6: Instantiate a function that calls another function which includes multiple layers of `block` and `if` constructs. Verify that the `br` instruction inside these constructs resolves to the correct block after the function call.

(assert_invalid
  (module
    (func $callee
      (block (block (block (if (i32.const 1) (br 2)))))
    )
    (func $caller
      (call $callee)
    )
  )
  "type mismatch"
)