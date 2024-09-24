;; 2. **Test Loop with Unreachable After Imported Function Call:**    - Create a loop in one module that calls an imported function and follows the call with an `unreachable` instruction. Ensure the function traps correctly regardless of loop or module boundaries.    - **Constraint:** Ensure that the stack state is consistent across the boundary, and `unreachable` within the loop causes immediate trapping without further loop iterations.

(assert_invalid
  (module
    (import "" "" (func $imported))
    (func
      (loop
        (call $imported)
        (unreachable)
      )
    )
  )
  "type mismatch"
)