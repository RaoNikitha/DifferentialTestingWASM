;; 2. **Test 2**:     - Description: Implement a nested control flow with `block` and `loop` instructions containing `nop` before encountering an `unreachable` instruction. This tests if `nop` in complex structures influences reaching `unreachable`.    - Constraint: Ensuring `nop` inside nested controls do not alter the inner structured flow leading to `unreachable`.

(assert_invalid
  (module 
    (func (block 
             (loop 
               (nop) 
               (unreachable)
             ) 
           ) 
    ) 
  )
  "unreachable error"
)