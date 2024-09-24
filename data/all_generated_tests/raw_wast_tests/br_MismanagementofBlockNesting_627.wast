;; 8. **Test 8**: Construct blocks within an `if`-block, followed by a `br` instruction targeting nested `block` label indices, ensuring effective stack unwinding and type management without breaking structured control flow.

(assert_invalid
  (module
    (func
      (local i32)
      (block
        (block
          (block
            (if (i32.const 1)
              (then
                (br 2)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)