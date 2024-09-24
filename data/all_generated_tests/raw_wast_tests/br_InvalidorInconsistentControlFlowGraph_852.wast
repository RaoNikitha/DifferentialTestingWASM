;; 3. **Test Description:** Construct an `if` statement with `br` instructions targeting the enclosing `block`. Ensure the `br` instructions are in the `else` part and validate if the CFG can handle the branch effectively by maintaining the structured flow. This should reveal discrepancies where the wizard_engine might not handle the operand stack correctly.

(assert_invalid
  (module
    (func
      (block
        (if (i32.const 1) (then) (else (br 1)))
      )
    )
  )
  "invalid branch depth"
)