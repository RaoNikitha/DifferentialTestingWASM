;; 3. Construct an `if` instruction with an `else` clause that fails to meet the matching operand stack requirements as specified by the blocktype, leading to CFG misalignment.

(assert_invalid
  (module 
    (func $mismatch-operands (result i32 i32)
      (if (result i32 i32) (i32.const 1)
        (then (i32.const 1))
        (else (i32.const 2) (i32.const 3) (i32.const 4))
      )
    )
  )
  "type mismatch"
)