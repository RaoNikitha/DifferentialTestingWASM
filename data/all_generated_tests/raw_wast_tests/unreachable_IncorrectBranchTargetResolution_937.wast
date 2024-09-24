;; Implement an WebAssembly function with several nested `blocks` and `loops`, inducing a `br` instruction to an incorrect block, ensuring precise branch target handling by following with `unreachable`. Compare how differential environments handle and log these operations.

(assert_invalid
  (module
    (func $test-differential-unreachable-br (result i32)
      (block
        (block
          (loop
            (block
              unreachable
              br 3
            )
          )
        )
      )
      i32.const 0
    )
  )
 "type mismatch"
)