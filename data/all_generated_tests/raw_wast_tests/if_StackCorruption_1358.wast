;; 9. **Test 9**: Generate an `if` instruction with a cycle in operand stack modification – pushing values repeatedly in the `then` branch while the `else` branch performs underflowing operations causing deliberate mismatches, leading to stack height corruptions. These should especially be visible during forward branching validation.

(assert_invalid
 (module (func $cycle-operand-stack (result i32)
  (if (result i32) 
   (i32.const 1) 
    (then 
      (i32.const 1) 
      (i32.const 1) 
      (i32.add)
    ) 
    (else 
      (i32.const 2) 
      (drop) 
      (drop)
    ) 
    (br 0)
  )
 ))
 "type mismatch"
)