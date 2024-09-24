;; 2. **Test to validate control flow interruption within nested `if` statements:**    - Insert the `unreachable` instruction inside the `false` branch of an `if` block, and validate if control reaches it in that context.    - **Constraint:** Ensures strict handling of conditional logic and proper branch evaluation.    - **Related to**: Confirms if the conditional misinterpretation can trigger traps unintentionally.

(assert_invalid
  (module
    (func $type-if-num-vs-num-in-nested-unreachable (result i32)
      (block (result i32)
        (if (i32.const 1)
          (then (i32.const 42))
          (else (unreachable) (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)