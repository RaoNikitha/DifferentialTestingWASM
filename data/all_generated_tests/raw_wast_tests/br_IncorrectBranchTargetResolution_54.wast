;; 5. **Test Description: Loop With Early Exit**    - Implement a `loop` with an early exit using a `br` instruction that targets a `block` outside the loop.

(assert_invalid
  (module
    (func $loop-with-early-exit
      (loop $loop
        (block $exit
          (i32.const 0)
          (br 1) 
        )
      )
    )
  )
  "unknown label"
)