;; 8. **Nested Loop with Conditional Branch Test:**    - Insert an `unreachable` inside a deeply nested loop with a mix of `br_if` instructions targeting both inner and outer loops. Confirm the `unreachable` causes a trap and that branch resolution does not divert flow before trapping.

(assert_invalid
  (module
    (func $nested-loop-with-conditional-branch
      (loop
        (loop
          (br_if 1 (i32.const 1))  ;; Branch to outer loop conditionally
          (unreachable)  ;; Unconditional trap
        )
      )
    )
  )
  "unreachable instruction causing trap within nested loops"
)