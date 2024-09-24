;; 7. An improper `if` instruction setup in the `then` block leading to a `call` of an imported function that misaligns the operand stack expected by further instructions, contrasted with a proper sequence in the `else` block. This tests handling of external function calls within the control flow.

(assert_invalid
  (module (func $imported_func (import "env" "imported_func") (param i32))
    (func $test
      (i32.const 1)
      (if (result i32)
        (then (call $imported_func (i32.const 0)) (i32.const 1))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)