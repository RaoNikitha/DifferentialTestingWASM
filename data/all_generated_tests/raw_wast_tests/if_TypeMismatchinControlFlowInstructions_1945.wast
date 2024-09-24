;; 6. A structure where an `if` instruction with `blocktype` `[] -> [i32]` is implemented, but one of the nested instructions generates an `i32` incorrectly resulting in stack type errors.

(assert_invalid
  (module (func $invalid-nested-instr
    (if (result i32)
      (i32.const 1)
      (then
        (i32.const 1)
        ;; Incorrectly generate an additional i32 in the then block
        (i32.const 42)
      )
      (else
        (i32.const 2)
      )
    )
  ))
  "type mismatch"
)