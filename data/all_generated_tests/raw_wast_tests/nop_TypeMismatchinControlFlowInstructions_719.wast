;; 10. **Test 10: Operand Stack Mismatch in Block with `nop`**     - Insert a `nop` within a block followed by an instruction that improperly pops from the operand stack resulting in a mismatch.     - **Constraint**: `nop` should not affect stack state assumptions before operand pop.     - **Type Mismatch Check**: Ensures block’s operand stack state remains coherent in presence of `nop`.

(assert_invalid
  (module
    (func $block-nop-stack-mismatch
      (block
        (nop)
        i32.const 1
        i64.add
      )
    )
  )
  "type mismatch"
)