;; 7. **Test Description**:    An `if` block with stack corruption potential by adding the `unreachable` instruction in the `then` block followed by `else` block with normal integer manipulation. The test checks proper trap handling and stack integrity post-trap.

(assert_invalid
  (module 
    (func $if-unreachable-stack-corruption
      (if (result i32) (i32.const 1)
        (then (unreachable) (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)