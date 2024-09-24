;; 6. **Test Name: No-Operation Within Nested Function Returns**    - **Description**: Insert `nop` instructions within nested function returns.    - **Constraint**: Verify that nested returns are not disrupted by the presence of `nop`.    - **Improper Handling Check**: Ensures that `nop` introduction does not alter nested return control flow.    - **Expected Behavior**: Consistent nested return behavior despite `nop` presence.

(assert_invalid
  (module
    (func $nested-returns-nop
      (block
        (block
          (return)
          (nop)
        )
        (return)
        (nop)
      )
      (nop)
    )
  )
  "unexpected end of block"
)