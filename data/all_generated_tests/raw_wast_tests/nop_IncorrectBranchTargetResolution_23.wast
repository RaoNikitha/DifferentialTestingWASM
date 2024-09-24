;; 4. **Test 4: Complex Control Flow with Nested Blocks and `nop`**:    - **Description**: Use a nested control flow structure with multiple blocks and loops, placing `nop` at strategic points. Examine if the branches (`br`, `br_if`, `br_table`) still target the correct labels within the nested environment.    - **Constraint**: The program should maintain correct label resolution and branch targeting with `nop` in various positions.    - **Relation to Incorrect Branch Target Resolution**: Validates that nested branches correctly jump to their intended targets despite intervening `nop` instructions.

(assert_invalid
  (module 
    (func $complex-control-flow 
      (block $outer 
        (block $inner 
          (loop $myloop 
            (br_if $inner (i32.const 1)) 
            (nop) 
            (br $outer)
          )
          (nop)
        )
        (nop)
      )
    )
  )
  "type mismatch"
)