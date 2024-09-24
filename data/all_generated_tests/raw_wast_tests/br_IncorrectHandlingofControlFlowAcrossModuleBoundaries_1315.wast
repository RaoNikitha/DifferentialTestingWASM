;; 6.  *Test Description*: Verify the behavior of a `br` instruction that targets a `block` label from an imported module, where the function nesting depth changes.     *Constraint Being Checked*: Confirms that the nesting depth context and operand stack states are properly managed when branches target blocks across module boundaries.

(assert_invalid
  (module
    (import "env" "importedFunc" (func))
    (func (type 0) (block
      (call 0)
      (br 1)
    ))
  )
  "unknown label"
)