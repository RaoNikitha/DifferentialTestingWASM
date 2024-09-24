;; 2. Use a `loop` instruction with a block type requiring an empty stack at the loop entry but include an instruction sequence that results in an `i64` value on the stack before entering the loop. This checks whether the implementations handle stack inconsistencies due to incorrect initial type assumptions.

(assert_invalid
  (module (func $stack-mismatch-before-loop (result i32)
    (i64.const 42)
    (loop (result i32) 
    )
  ))
  "type mismatch"
)