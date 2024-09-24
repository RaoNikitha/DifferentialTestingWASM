;; 4. **Test with `nop` Preceding a Loop:**    - Place a `nop` immediately before a loop instruction and ensure that entering the loop works as expected.    - **Constraint Tested:** Ensures the `nop` does not disrupt entering control structures like loops.

(assert_invalid
  (module (func
    nop
    loop (block)
    end
  ))
  "invalid type"
)