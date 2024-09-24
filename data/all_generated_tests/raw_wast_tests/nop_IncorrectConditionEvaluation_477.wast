;; 8. **Complex Boolean Expressions and `nop`**:    Use complex boolean expressions whose result is checked by `br_if`, placing `nop` strategically within these expressions. Ensure the correct boolean outcome determines the branch, unaffected by the `nop`.

(assert_invalid
  (module (func
    (block $block
      (br_if $block (i32.eq (i32.const 1) (nop) (i32.const 1)))
    )
  ))
  "type mismatch"
)