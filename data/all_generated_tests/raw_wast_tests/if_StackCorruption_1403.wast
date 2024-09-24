;; Implement an `if` instruction without a block type and force exhausting the operand stack within `then` and `else` blocks. This will test the consistency of stack height enforcement and context validation during control flow.

(assert_invalid
  (module (func
    (if (i32.const 0) 
      (then (drop) (drop)) 
      (else (drop) (drop))
    )
  ))
  "stack underflow"
)