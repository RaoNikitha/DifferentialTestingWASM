;; Create a loop with a `block` inside and a `br` instruction that breaks out of the `block` but also skips subsequent instructions by jumping to label zero of the outer loop. Validate how the stack is managed in both implementations. Testing for: Properly maintaining and unwinding the operand stack when breaking out of nested blocks and resuming execution at the correct point.

(assert_invalid
  (module
    (func
      (loop $outer_loop
        (block $inner_block
          (br 1)
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)