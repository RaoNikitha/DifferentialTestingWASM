;; 5. **Test Description**:    A nested `if` block where the inner `if` instruction’s `then` and `else` branches manipulate the stack differently. Test for appropriate stack unwinding and matching height on exiting both blocks.

(assert_invalid
 (module
  (func $nested-if-stack-manipulation
   (result i32)
   (i32.const 0)
   (if (result i32)
    (i32.const 1)
    (then
     (i32.const 1)
     (if (result i32)
      (i32.const 1)
      (then
       (i32.const 2)
       drop
      )
      (else
       (nop)
      )
     )
    )
    (else
     (i32.const 3)
    )
   )
  )
 )
 "type mismatch"
)