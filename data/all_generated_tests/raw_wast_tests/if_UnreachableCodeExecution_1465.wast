;; 6. Develop a branching scenario where a false `if` condition leads to a nested `else` block with an `unreachable` instruction. Validate that the nested branching accurately traps without reaching the `unreachable`.

(assert_invalid
  (module (func $nested-else-branch (result i32)
    (i32.const 0)
    (if (result i32)
      (then 
        (i32.const 42)
      )
      (else
        (if (result i32)
          (then (unreachable))
          (else (unreachable))
        )
      )
    )
  ))
  "unreachable instruction encountered"
)