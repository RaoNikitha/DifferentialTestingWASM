;; 9. **Immediate `br` in Nested `if` Blocks**: Include a `br` instruction immediately after opening the nested `if` blocks to see if the implementation correctly exits the appropriate block without executing the nested instructions.

(assert_invalid
  (module (func $immediate-br-in-nested-if (result i32)
    (if (result i32) (i32.const 1)
      (then (if (result i32) (i32.const 1) (then (br 1) (i32.const 0)) (else (i32.const 2))) (i32.const 3))
      (else (i32.const 4))
    )
  ))
  "type mismatch"
)