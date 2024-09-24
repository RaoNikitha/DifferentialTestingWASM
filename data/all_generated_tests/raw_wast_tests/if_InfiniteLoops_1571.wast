;; 2. **Test 2**: Implement an `if` instruction that conditionally enters a `loop` which should only execute once. Test whether the `resetInit` mechanism is functioning by ensuring the loop does not become infinite due to improper state handling after the `else` block.

(assert_invalid
  (module
    (func $nested-loop-if
      (if (result i32)
        (i32.const 1) 
        (then 
          (loop $L
            (if 
              (i32.const 1) 
              (then 
                (br $L)
              )
            )
          )
          (i32.const 0)
        )
        (else 
          (i32.const 0)
        )
      )
    )
  )
  "type mismatch"
)